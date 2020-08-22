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
        var dataSource: UITableViewDataSource? {
        didSet {
            self.tableView.dataSource = dataSource
            self.tableView.reloadData()
        }
    }
    
    // MARK: Controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handleKeyboardEvents(self.view)
    }
    
    // MARK: Views customization
    override func customizeView(_ title: String = "") {
        super.customizeView(chatViewModel?.friend.name ?? "")
        
        tableView.delegate = self
        
        let cellNib = UINib(nibName: "ChatListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: chatViewModel!.chatListCellId)
        
        dataSource = ChatDataSource.init(withMessages: (chatViewModel?.messages)!)
    }
    
    // MARK: Actions
    @IBAction func sendPressed(_ sneder: UIButton) {
        
    }
    
}

// MARK:- UITableView Delegate
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Estimate the height of the text
        if let messageText = chatViewModel?.messages?[indexPath.row].text {
            return messageText.calculatedFrame(ofFont: AppFonts.normal)?.height ?? 0
        }
        return 100
    }
}
