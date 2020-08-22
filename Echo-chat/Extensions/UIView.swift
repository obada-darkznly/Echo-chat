//
//  UIView.swift
//  Echo-chat
//
//  Created by Obada on 8/22/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit


public class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIView {
    /// add **touch up selector** to any **view**
    ///
    /// Usage:
    ///
    ///     view.tapAction{print("View tapped!")}
    ///
    /// - Parameters:
    ///     - closure: The block to be excuted when tapping.
    func tapAction( _ closure: @escaping ()->()){
        self.isUserInteractionEnabled = true
        let sleeve = ClosureSleeve(closure)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: sleeve, action: #selector(ClosureSleeve.invoke))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
}
