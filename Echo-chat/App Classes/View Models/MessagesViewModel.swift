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
    let friendChatSegue = "friendChatSegue"
    var messages: [Message] = []
    var selectedFriend: Friend?
    
    
    // MARK: Methods
    
    /// Fetches the messages from the data store
    func refreshMessages(completion: @escaping(_ success: Bool) -> Void) {
        if messages.count == 200 {
            completion(false)
            return
        }
        DataStore.shared.loadMessages { (messages) in
            if let messages = messages {
                self.messages += messages
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
