//
//  FriendsListViewModel.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation


class MessagesViewModel {
    
    // MARK: Properties
    let firendsCellId = "messagesListCell"
    
    
    // MARK: Methods
    
    /// Fetches the messages from the data store
    func refreshMessages(completion: @escaping(_ messages: [Message]?) -> Void) {
        DataStore.shared.loadMessages { (messages) in
            if let messages = messages {
                completion(messages)
            } else {
                completion(nil)
            }
        }
    }
}
