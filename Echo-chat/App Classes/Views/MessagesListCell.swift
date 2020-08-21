//
//  FriendsListCell.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit
import PINRemoteImage


class MessagesListCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    // MARK: Cell's life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    // MARK: Cell's customization
    func customizeView() {
        
        nameLabel.font = AppFonts.normal
        nameLabel.textColor = AppColors.black
        
        messageLabel.font = AppFonts.small
        messageLabel.textColor = AppColors.gray
        
        dateLabel.font = AppFonts.small
        dateLabel.textColor = AppColors.gray
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.backgroundColor = AppColors.grayLight
    }
    
    // MARK: Cell's population
    func populate(withMessage message: Message) {
        nameLabel.text = message.friend?.name
        messageLabel.text = message.text ?? ""
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        if let date = message.date {
            dateLabel.text = formatter.string(from: date)
        }
        if let imageString = message.friend?.profileImageString {
            let imageUrl = URL(string: imageString)!
            profileImageView.pin_setImage(from: imageUrl)
        }
    }
}
