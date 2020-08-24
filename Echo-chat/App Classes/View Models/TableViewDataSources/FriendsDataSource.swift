//
//  MessagesDataSource.swift
//  Echo-chat
//
//  Created by Obada on 8/21/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit


class FriendsDataSource: NSObject {
    let friends: [Friend]
    
    init(withFriends friends: [Friend]) {
        self.friends = friends
    }
}

extension FriendsDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsListCell") as? FriendsListCell else { return UITableViewCell() }
        cell.populate(withFriend: friends[indexPath.row])
        return cell
    }
}
