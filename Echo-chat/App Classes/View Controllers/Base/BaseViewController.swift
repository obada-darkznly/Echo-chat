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
    
    // MARK:- Controller's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavBarTheme()
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK:- Controller's customization
    
    func customizeView(_ title: String = "") {
        setNavBarTitle(title: title, color: .white)
        
        self.view.backgroundColor = AppColors.white
        
        enableEndEditingGesture = true
    }
    
    // MARK: Navigation bar customization
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// Sets the title of the navigation bar
    private func setNavBarTitle(title: String, color: UIColor) {
        let titleViewFrame = CGRect(x: 80, y: 0, width: ScreenSize.width - 160, height: 44)
        let titleLabelFrame = CGRect(x: 0, y: 0, width: titleViewFrame.width, height: titleViewFrame.height)
        let titleView = UIView(frame: titleViewFrame)
        let titleLabel = UILabel(frame: titleLabelFrame)
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = AppFonts.xBig
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = color
        titleView.addSubview(titleLabel)
        self.navigationItem.titleView = titleView
    }
    
    func setNavBarTheme() {
        let apperence = UINavigationBarAppearance()
        apperence.configureWithTransparentBackground()
        apperence.backgroundColor = AppColors.purple
        apperence.titleTextAttributes = [.foregroundColor: UIColor.white, .font: AppFonts.xBig]
        apperence.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: AppFonts.xBig]
        
        self.navigationController?.navigationBar.standardAppearance = apperence
        self.navigationController?.navigationBar.scrollEdgeAppearance = apperence
        self.navigationController?.navigationBar.isTranslucent = true
        
        if let leftButton = navigationItem.leftBarButtonItem {
            leftButton.tintColor = .white
        }

    }
    
    // MARK:- Handeling keyboard events
    
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
    
     /// enable end editing gesture to close keyboard and end editing
    var enableEndEditingGesture: Bool = true {
        didSet {
            view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        }
    }
}


