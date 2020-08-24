//
//  FriendsListCell.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit
import PINRemoteImage


class FriendsListCell: UITableViewCell {
    
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
        
        self.tapAction {
            
        }
        
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
    func populate(withFriend friend: Friend) {
        nameLabel.text = "\(friend.firstName) \(friend.lastName)"
        messageLabel.text = friend.messages?.last?.text ?? ""
        
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        if let date = friend.messages?.last?.timeStamp {
            dateLabel.text = formatter.string(from: date)
        }
        if let imageString = friend.profileImageString {
            let imageUrl = URL(string: imageString)!
            profileImageView.pin_setImage(from: imageUrl)
        }
    }
}
