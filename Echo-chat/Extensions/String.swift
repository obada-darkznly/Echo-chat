//
//  String.swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import Foundation
import UIKit


extension String {
    /// Returns the width and height relative to the given string
    func calculatedFrame(ofFont font: UIFont) -> CGSize? {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : font], context: nil)
        return  CGSize(width: estimatedFrame.width, height: estimatedFrame.height + 24)
    }
}
