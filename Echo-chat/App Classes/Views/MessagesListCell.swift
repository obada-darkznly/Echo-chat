//
//  FriendsListCell.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit


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
    }
    
    // MARK: Cell's population
    func populate() {
        
    }
}
