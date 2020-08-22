//
//  ChatDataSource.swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit


class ChatDataSource: NSObject {
    
    let messages: [Message]
    
    init(withMessages messages: [Message]) {
        self.messages = messages
    }
}

extension ChatDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chatListCellId") as? ChatListCell else { return UITableViewCell() }
        cell.populate(withMessage: messages[indexPath.row])
        return cell
    }
}
