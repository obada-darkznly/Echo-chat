//
//  UIViewController.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit
import Combine


class BaseViewController: UIViewController {
    
    // MARK: Properties
    var keyboardWillShowSubscriber: AnyCancellable?
    var keyboardWillHideSubscriber: AnyCancellable?
    var keyboardBottomMultiplier: CGFloat = 1
    
    /// Ajdust UIView or UIScrollView with Keybaord events
    /// - Parameters:
    /// - subscriberView: You can pass UIView or UIScrollView
    func handleKeyboardEvents(_ subscriberView: UIView, willShowClosure: (()->Void)? = nil, willHideClosure: (()->Void)? = nil, bottomOffsetMultiplier: CGFloat = 1) {
        // if UIView is scrollView apply changes on contentInset.bottom
        // else apply changes on frame Y origin
        var multiplier: CGFloat = -1
        if let _ = subscriberView as? UIScrollView {
            multiplier = 1
        }
        
        let keyboardWillOpen = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .map {$0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect}
            .map {$0.height * multiplier}
        
        let keyboardWillHide =  NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0)}
        
        self.keyboardBottomMultiplier = bottomOffsetMultiplier
        keyboardWillShowSubscriber = keyboardWillOpen.sink { (keyboardHeight) in
            willShowClosure?()
            if let subscriberScroll = subscriberView as? UIScrollView {
                subscriberScroll.contentInset.bottom = (keyboardHeight * self.keyboardBottomMultiplier)
            } else {
                subscriberView.frame.origin.y = (keyboardHeight * self.keyboardBottomMultiplier)
                UIView.animate(withDuration: 0.2) {
                    subscriberView.layoutIfNeeded()
                }
            }
        }
        
        keyboardWillHideSubscriber = keyboardWillHide.sink { (_) in
            willHideClosure?()
            if let subscriberScroll = subscriberView as? UIScrollView {
                subscriberScroll.contentInset.bottom = 0
            } else {
                subscriberView.frame.origin.y = 0
                UIView.animate(withDuration: 0.2) {
                    subscriberView.layoutIfNeeded()
                }
            }
        }
    }
}
