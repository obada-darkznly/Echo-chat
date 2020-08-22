//
//  ChatListCell.swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit



class ChatListCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewLeadingConstraint: NSLayoutConstraint!
    
    // MARK: Cell's life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeCell()
    }
    
    // MARK: Cell's customization
    func customizeCell() {
        
        containerView.backgroundColor = AppColors.blue
        containerView.layer.cornerRadius = 16
        
        textView.font = AppFonts.normal
        textView.textColor = .white
        
        bubbleImageView.tintColor = AppColors.blue
        bubbleImageView.contentMode = .scaleToFill
        bubbleImageView.image = #imageLiteral(resourceName: "friendBubble")
            .withAlignmentRectInsets(UIEdgeInsets(top: 8, left: 26, bottom: 8, right: 8))
            .withRenderingMode(.alwaysTemplate)
    }
    
    // MARK: Cell's population
    func populate(withMessage message: Message) {
        // Calcuate the height of the bubble based on the text
        if message.text?.calculatedFrame(ofFont: AppFonts.normal)?.width ?? 0 < 275 {
            containerViewWidthConstraint.constant = message.text?.calculatedFrame(ofFont: AppFonts.normal)?.width ?? 250
        }
        configureStyle(forSender: message.isMe)
        textView.text = message.text
    }
    
    /// Configures the allignment and background color of the message bubble
    private func configureStyle(forSender isMe: Bool) {
        let screenWidth = UIScreen.main.bounds.width
        if isMe {
            containerViewLeadingConstraint.constant = screenWidth - containerViewWidthConstraint.constant - 16
            containerView.backgroundColor = AppColors.ligtBlue
            
            bubbleImageView.tintColor = AppColors.ligtBlue
            bubbleImageView.image = #imageLiteral(resourceName: "senderBubble")
                .withAlignmentRectInsets(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 26))
                .withRenderingMode(.alwaysTemplate)
        }
        self.layoutIfNeeded()
    }
}
