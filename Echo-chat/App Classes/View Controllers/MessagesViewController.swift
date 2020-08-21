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
        
        customizeView()
        
        // Refresh the messages
        messagesViewModel.refreshMessages { (messages) in
            if let messages = messages {
                self.dataSource = MessagesDataSource(withMessages: messages)
            } else {
                print("Error in fetching messages from data source")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Controller's customization
    func customizeView() {
        
        tableView.delegate = self
        
        // Registering the cell with the table view
        let cellNib = UINib(nibName: "MessagesListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: messagesViewModel.firendsCellId)
        
    }
}

extension MessagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
