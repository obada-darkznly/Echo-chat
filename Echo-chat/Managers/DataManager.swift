//
//  DataManager.swift
//  Echo-chat
//
//  Created by Obada on 8/24/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation
import Fakery


/// - Data manager that creates dummy daya
///     - Creates dummy daya
///     - Retrieves data
///     - and manipulates data
class DataManager: NSObject {
    
    // Singelton
    static let shared = DataManager()
    
    private let faker = Faker()
    
    func generateData() {
        clearData()
        var friends = [Friend]()
        var currentMessages: [Message]? = []
        for i in 0...199 {
            currentMessages?.append(Message(withText: faker.lorem.paragraph(sentencesAmount: Int(arc4random_uniform(10)) + 2), timeStamp: faker.date.between(Date(timeIntervalSinceNow: -10000000), Date()), andisMe: false)) 
            let friend = Friend(withFirstName: faker.name.firstName(), lastName: faker.name.lastName(), messages: currentMessages, andProfileImageString: "https://picsum.photos/50/?random=\(i)")
            friends.append(friend)
            currentMessages? = []
        }
        friends.sort(by: {$0.messages?.last?.timeStamp?.compare(($1.messages?.last?.timeStamp!)!) == .orderedDescending})
        DataStore.shared.friends = friends
    }
    
    func fetchMessages(forFriend friend: Friend) -> [Message]? {
        DataStore.shared.friends?.first(where: {$0.firstName == friend.firstName})?.messages
    }
    
    func save(_ message: Message, forFriend friend: Friend, completion: @escaping(_ success: Bool) -> Void) {
        if DataStore.shared.friends?.first(where: {$0.firstName == friend.firstName})?.messages?.append(message) != nil {
            completion(true)
        }
        completion(false)
    }
    
    func clearData() {
        DataStore.shared.friends = nil
    }
}
