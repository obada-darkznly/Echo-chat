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
    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!
    
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
        textView.textColor = AppColors.black
    }
    
    // MARK: Cell's population
    func populate(withMessageText text: String) {
        if text.calculatedFrame(ofFont: AppFonts.normal)?.width ?? 0 < 275 {
            containerViewWidthConstraint.constant = text.calculatedFrame(ofFont: AppFonts.normal)?.width ?? 250
            self.layoutIfNeeded()
        }
        textView.text = text
    }
}
