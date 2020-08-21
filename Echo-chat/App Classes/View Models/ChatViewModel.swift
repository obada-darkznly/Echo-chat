//
//  ChatViewModel.swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation



struct ChatViewModel {
    
    // MARK: Properties
    var friend: Friend
    
    init(withFriend friend: Friend) {
        self.friend = friend
    }
}
