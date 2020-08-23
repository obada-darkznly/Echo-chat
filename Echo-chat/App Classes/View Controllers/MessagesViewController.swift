//
//  FriendsViewController.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit

class MessagesViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var messagesViewModel = MessagesViewModel()
    
    var dataSource: UITableViewDataSource? {
        didSet {
            self.tableView.dataSource = dataSource
            self.tableView.reloadData()
        }
    }

    // MARK: Controller's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Refresh the messages
        messagesViewModel.refreshMessages { (success) in
            if success {
                self.dataSource = MessagesDataSource(withMessages: self.messagesViewModel.messages)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Controller's customization
    override func customizeView(_ title: String = "") {
        super.customizeView("Chats")
        tableView.delegate = self
        
        // Registering the cell with the table view
        let cellNib = UINib(nibName: "MessagesListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: messagesViewModel.firendsCellId)
        
    }
}

// MARK:- Table view delegate
extension MessagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        messagesViewModel.selectedFriend = messagesViewModel.messages[indexPath.row].friend
        performSegue(withIdentifier: messagesViewModel.friendChatSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK:- Navigation and segue
extension MessagesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chatVC = segue.destination as? ChatViewController, let friend = messagesViewModel.selectedFriend {
            chatVC.chatViewModel = ChatViewModel(withFriend: friend)
        }
    }
}
