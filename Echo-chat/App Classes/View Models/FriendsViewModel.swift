//
//  FriendsListViewModel.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation


class FriendsViewModel {
    
    // MARK: Properties
    let firendsCellId = "friendsListCell"
    let friendChatSegue = "friendChatSegue"
    var friends: [Friend] = []
    var selectedFriend: Friend?
    
    
    // MARK: Methods
    
    /// Fetches the messages from the data store
    func refreshFriends(completion: @escaping(_ success: Bool) -> Void) {
        if friends.isEmpty {
            DataManager.shared.generateData()
            self.friends = DataStore.shared.friends ?? []
            completion(true)
        } else {
            completion(false)
            return
        }
    }
    
    func sortFriends() {
        friends.sort(by: {$0.messages?.last?.timeStamp?.compare(($1.messages?.last?.timeStamp!)!) == .orderedDescending})
    }
}
