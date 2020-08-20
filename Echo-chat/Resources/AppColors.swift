//
//  AppColors.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit


struct AppColors {
    
    /// Light theme color white(#FFFFFF) - Dark theme color black(#1C1C1F)
    public static let white: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1215686275, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }()
    
    /// Light theme color blue(#324BE6) - Dark theme color blue(#3B6194)
    public static let ligtBlue: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.337254902, green: 0.8117647059, blue: 0.8823529412, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 0.5019607843, green: 1, blue: 0.8588235294, alpha: 1)
            }
        }
    }()
    
    /// Light theme color blue(#324BE6) - Dark theme color blue(#3B6194)
    public static let blue: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.3254901961, green: 0.5647058824, blue: 0.8509803922, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 0.2823529412, green: 0.7490196078, blue: 0.8901960784, alpha: 1)
            }
        }
    }()
    
    /// Light theme color blue(#324BE6) - Dark theme color blue(#3B6194)
    public static let purple: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.4117647059, green: 0.1882352941, blue: 0.7647058824, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 0.4549019608, green: 0, blue: 0.7215686275, alpha: 1)
            }
        }
    }()
    
    /// Light theme color grayDark(#373737) - Dark theme color grayDark(#8E8E93)
    public static let grayDark: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
            }
        }
    }()
    
    /// Light theme color gray(#828282) - Dark theme color gray(#828282)
    public static let gray: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
            }
        }
    }()
    
    /// Light theme color grayLight(#C4C4C4) - Dark theme color grayLight(#646464)
    public static let grayLight: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
            }
        }
    }()
    
    
    /// Light theme color black(#1C1C1C) - Dark theme color white(#E3E3E3)
    public static let black: UIColor = {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                /// Return the color for Dark Mode
                return #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
            } else {
                /// Return the color for Light Mode
                return #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1098039216, alpha: 1)
            }
        }
    }()
}

