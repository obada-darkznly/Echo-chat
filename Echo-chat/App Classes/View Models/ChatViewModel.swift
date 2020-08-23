//
//  ChatViewModel.swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation
import Combine



class ChatViewModel {
    
    // MARK: Properties
    var friend: Friend
    var messages: [Message]?
    let chatListCellId: String = "chatListCellId"
    var messageSentPublisher = CurrentValueSubject<Bool, Never>(false)
    
    init(withFriend friend: Friend) {
        self.friend = friend
        self.messages = friend.messages?.allObjects as? [Message]
        self.messages?.sort(by: {$0.date?.compare($1.date!) == .orderedAscending})
    }
    
    /// Sends a message to the selected friend
    func sendMessage(withText text: String) {
        DataStore.shared.createMessage(withText: text, friend: friend) { (message) in
            if let message = message {
                self.echoMessage(ofText: text)
                self.messages?.append(message)
                self.messageSentPublisher.send(true)
            } else {
                self.messageSentPublisher.send(false)
            }
        }
    }
    
    /// Echos the message back at the user after 0.5 seconds
    private func echoMessage(ofText text: String) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            DataStore.shared.createMessage(withText: text, friend: self.friend, andIsMe: false) { (message) in
                if let message = message {
                    self.messages?.append(message)
                    self.messageSentPublisher.send(true)
                } else {
                    self.messageSentPublisher.send(false)
                }
            }
        }
    }
}
