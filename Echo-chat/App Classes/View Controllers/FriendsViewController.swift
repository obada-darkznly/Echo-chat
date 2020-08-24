//
//  FriendsViewController.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit

class FriendsViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var friendsViewModel = FriendsViewModel()
    
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
        friendsViewModel.refreshFriends { (success) in
            if success {
                self.dataSource = FriendsDataSource(withFriends: self.friendsViewModel.friends)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        friendsViewModel.sortFriends()
        tableView.reloadData()
    }
    
    // MARK: Controller's customization
    override func customizeView(_ title: String = "") {
        super.customizeView("Chats")
        tableView.delegate = self
        
        // Registering the cell with the table view
        let cellNib = UINib(nibName: "FriendsListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: friendsViewModel.firendsCellId)
        
    }
}

// MARK:- Table view delegate
extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        friendsViewModel.selectedFriend =   friendsViewModel.friends[indexPath.row]
        performSegue(withIdentifier: friendsViewModel.friendChatSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK:- Navigation and segue
extension FriendsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chatVC = segue.destination as? ChatViewController, let friend = friendsViewModel.selectedFriend {
            chatVC.chatViewModel = ChatViewModel(withFriend: friend)
        }
    }
}
