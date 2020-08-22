//
//  ChatViewModel.swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation



class ChatViewModel {
    
    // MARK: Properties
    var friend: Friend
    var messages: [Message]?
    
    init(withFriend friend: Friend) {
        self.friend = friend
        self.messages = friend.messages?.allObjects as? [Message]
        self.messages?.sort(by: {$0.date?.compare($1.date!) == .orderedAscending})
    }
}
