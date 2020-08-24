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
        self.messages = friend.messages
        self.messages?.sort(by: {$0.timeStamp?.compare($1.timeStamp!) == .orderedAscending})
    }
    
    /// Sends a message to the selected friend
    func sendMessage(withText text: String) {
        let message = Message(withText: text, timeStamp: Date(), andisMe: true)
        DataManager.shared.save(message, forFriend: friend) { (success) in
            if success {
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
            let message = Message(withText: text, timeStamp: Date(), andisMe: false)
            DataManager.shared.save(message, forFriend: self.friend) { (success) in
                if success {
                    self.messages?.append(message)
                    self.messageSentPublisher.send(true)
                } else {
                    self.messageSentPublisher.send(false)
                }
            }
        }
    }
}
