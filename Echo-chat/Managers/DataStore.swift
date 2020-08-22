//
//  DataStore.swift
//  Echo-chat
//
//  Created by Obada on 8/21/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation
import CoreData
import Fakery


class DataStore: NSObject {
    
    // Singelton
    public static var shared: DataStore = DataStore()
    
    private let delegate = UIApplication.shared.delegate as? AppDelegate
    // Fake data generator instance
    private let faker = Faker()
    
    // MARK: Methods
    
    /// Clears the cached data so it wouldn't duplicate
    private func clearData() {
        if let managedContext = delegate?.persistentContainer.viewContext {
            do {
                let entityNames = ["Friend", "Message"]
                try entityNames.forEach({
                    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: $0)
                    let objects = try managedContext.fetch(fetchRequest)
                    objects.forEach({
                        managedContext.delete($0)
                    })
                    try managedContext.save()

                })
            } catch let error as NSError{
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    /// Creates an array of friends to be stored in core data
    private func setupData() {
        // Clear old data before creating new data
        clearData()
        
        // toggle to handle both cases of having messages or not
        if let managedContext = delegate?.persistentContainer.viewContext {
            for i in 0 ... 199 {
                if let friend = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: managedContext) as? Friend  {
                    friend.name = "\(faker.name.firstName()) \(faker.name.lastName())"
                    // Get random image from Lorem Picsum website
                    friend.profileImageString = "https://picsum.photos/50/?random=\(i)"
                    if let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: managedContext) as? Message  {
                        message.text = faker.lorem.characters(amount: Int(arc4random_uniform(490)) + 11)
                        message.date = faker.date.between(Date(timeIntervalSinceNow: -1000000), Date())
                        message.friend = friend
                    }
                }
            }
            // save the array in core data
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    /// Fetches all the friends objects in Core data
    private func fetchFriends() -> [Friend]? {
        if let managedContext = delegate?.persistentContainer.viewContext {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Friend")
            do {
                return try managedContext.fetch(fetchRequest) as? [Friend]
            } catch {
                
            }
        }
        return nil
    }
    
    // Fetches the messages the from core data
    func loadMessages(completion: @escaping(_ messages: [Message]?) -> Void) {
        // setup the data before filtering and returning it
        setupData()
        var messages = [Message]()
        if let managedContext = delegate?.persistentContainer.viewContext {
            if let friends = fetchFriends() {
                for friend in friends {
                    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Message")
                    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                    fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                    fetchRequest.fetchLimit = 1
                    do {
                        let fetchedMessages = try managedContext.fetch(fetchRequest) as? [Message]
                        messages.append(contentsOf: fetchedMessages!)
                    } catch let error as NSError{
                        print("Could not fetch. \(error), \(error.userInfo)")
                    }
                }
            }
            messages.sort(by: {$0.date?.compare($1.date!) == .orderedDescending})
            completion(messages)
        }
        completion(nil)
    }
}
