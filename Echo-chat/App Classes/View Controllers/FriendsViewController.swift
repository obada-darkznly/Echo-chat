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

    // MARK: Controller's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Controller's customization
    func customizeView() {
        
        tableView.delegate = self
        
        // Registering the cell with the table view
        let cellNib = UINib(nibName: "FriendsListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: friendsViewModel.firendsCellId)
        
    }
}

extension FriendsViewController: UITableViewDelegate {
    
}
