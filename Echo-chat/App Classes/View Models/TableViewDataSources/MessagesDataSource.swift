//
//  MessagesDataSource.swift
//  Echo-chat
//
//  Created by Obada on 8/21/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit


class MessagesDataSource: NSObject {
    let messages: [Message]
    
    init(withMessages messages: [Message]) {
        self.messages = messages
    }
}

extension MessagesDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messagesListCell") as? MessagesListCell else { return UITableViewCell() }
        cell.populate(withMessage: messages[indexPath.row])
        return cell
    }
}
