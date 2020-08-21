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
        var hasMessage: Bool = true
        if let managedContext = delegate?.persistentContainer.viewContext {
            for i in 0 ... 199 {
                if let friend = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: managedContext) as? Friend  {
                    friend.name = "\(faker.name.firstName()) \(faker.name.lastName())"
                    // Get random image from Lorem Picsum website
                    friend.profileImageString = "https://picsum.photos/200/?random=\(i)"
                    if hasMessage {
                        if let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: managedContext) as? Message  {
                            message.text = faker.lorem.characters(amount: 50)
                            message.date = faker.date.between(Date(timeIntervalSinceNow: -1000000), Date())
                            message.friend = friend
                        }
                    }
                    hasMessage.toggle()
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
    
    // Fetches the data from core data
    func loadMessages(completion: @escaping(_ messages: [Message]?) -> Void) {
        // setup the data before fetching it
        setupData()
        if let managedContext = delegate?.persistentContainer.viewContext {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Message")
            do {
                completion(try managedContext.fetch(fetchRequest) as? [Message])
            } catch let error as NSError{
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        completion(nil)
    }
}
