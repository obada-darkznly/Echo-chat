//
//  ChatViewController .swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit



class ChatViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: Properties
    var chatViewModel: ChatViewModel?
    
    // MARK: Controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: Views customization
    override func customizeView(_ title: String = "") {
        super.customizeView(chatViewModel?.friend.name ?? "")
        
    }
    
    // MARK:- Actions
    @IBAction func sendPressed(_ sneder: UIButton) {
        
    }
    
}
