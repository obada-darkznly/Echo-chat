//
//  ChatViewController .swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit
import Combine


class ChatViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: Properties
    var chatViewModel: ChatViewModel?
        var dataSource: UITableViewDataSource? {
        didSet {
            self.tableView.dataSource = dataSource
            self.tableView.reloadData()
        }
    }
    var messageSentSubscriber: AnyCancellable?
    
    // MARK: Controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handleKeyboardEvents(self.view)
        messageSentSubscriber = chatViewModel?.messageSentPublisher.sink(receiveValue: { (messageSent) in
            if messageSent {
                self.dataSource = ChatDataSource(withMessages: self.chatViewModel?.friend.messages ?? [])
            }
        })
    }
    
    // MARK: Views customization
    override func customizeView(_ title: String = "") {
        super.customizeView(chatViewModel?.friend.firstName ?? "")
        
        let cellNib = UINib(nibName: "ChatListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: chatViewModel!.chatListCellId)
        tableView.delegate = self
        
        dataSource = ChatDataSource.init(withMessages: chatViewModel?.friend.messages ?? [])
        
        textView.backgroundColor = AppColors.grayLight.withAlphaComponent(0.8)
        textView.layer.cornerRadius = 16
        textView.font = AppFonts.normal
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 8)
        
        sendButton.setTitleColor(AppColors.purple, for: .normal)
    }
    
    // MARK: Actions
    @IBAction func sendPressed(_ sneder: UIButton) {
        chatViewModel?.sendMessage(withText: textView.text)
    }
    
}

// MARK:- Table view delegate
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        let headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = AppFonts.small
        headerLabel.textColor = AppColors.gray
        if let date = chatViewModel?.friend.messages?.first?.timeStamp {
            headerLabel.text =  formatter.string(from: date)
        } else {
            headerLabel.text = ""
        }
        return headerLabel
    }

}

