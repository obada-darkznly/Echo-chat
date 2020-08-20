//
//  AppFonts.swift
//  Echo-chat
//
//  Created by Obada on 8/20/20.
//  Copyright © 2020 Obada. All rights reserved.
//

import UIKit

struct AppFonts {
    // MARK: fonts names
    private static let fontBold = "HelveticaNeue-Bold"
    private static let fontMedium = "HelveticaNeue-Medium"
    private static let fontRegular = "HelveticaNeue"
    private static let fontThin = "HelveticaNeue-Thin"
    
    // MARK: font sizes
    public static let sizeXXBig: Double = 32
    public static let sizeXBig: Double = 28
    public static let sizeBig: Double = 20
    public static let sizeNormal: Double = 16
    public static let sizeSmall: Double = 14
    public static let sizeXSmall: Double = 12
    public static let sizeXXSmall: Double = 10
    
    public enum FontWeight {
        case bold
        case medium
        case regular
        case thin
    }
    
    // MARK: fonts getters
    /// font to be used in the app
    /// Size: 32
    static var xXBig: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXXBig * fontScale))!
    }
    
    static var xXBigMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXXBig * fontScale))!
    }
    
    static var xXBigBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXXBig * fontScale))!
    }
    /// Size: 28
    static var xBig: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale))!
    }
    
    static var xBigMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale))!
    }
    
    static var xBigBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale))!
    }
    
    /// Size: 20
    static var big: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale))!
    }
    
    static var bigMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale))!
    }
    
    static var bigBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale))!
    }
    
    /// Size: 16
    static var normal: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale))!
    }
    
    static var normalMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale))!
    }
    
    static var normalBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale))!
    }
    
    /// Size: 14
    static var small: UIFont {
        let fontName = getFontName(weight:.regular)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale))!
    }
    
    static var smallMedium: UIFont {
        let fontName = getFontName(weight:.medium)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale))!
    }
    
    static var smallBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale))!
    }
    
    /// Size: 12
    static var xSmall: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale))!
    }
    
    static var xSmallMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale))!
    }
    
    static var xSmallBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale))!
    }
    
    /// Size: 10
    static var xXSmall: UIFont {
        let fontName = getFontName(weight: .regular)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall * fontScale))!
    }
    
    static var xXSmallMedium: UIFont {
        let fontName = getFontName(weight: .medium)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall * fontScale))!
    }
    
    static var xXSmallBold: UIFont {
        let fontName = getFontName(weight: .bold)
        return UIFont(name: fontName, size: CGFloat(sizeXXSmall * fontScale))!
    }
    
    /// Get font scale
    static var fontScale:Double {
        var scale : Double = 1.0;
        if (ScreenSize.isSmallScreen) {// iPhone 4 & 5 (480 - 568)
            scale = 0.8;
        } else if (ScreenSize.isMidScreen) {// iPhone 6 & 7 (667)
            scale = 0.9;
        } else {// iPhone 6+ & 7+ & x (736)
            scale = 1.0;
        }
        return scale;
    }
    
    /// Get font name
    private static func getFontName(weight: FontWeight) -> String {
        switch weight {
        case .bold:
            return fontBold
        case .medium:
            return fontMedium
        case .regular:
            return fontRegular
        case .thin:
            return fontThin
        }
    }
    
    /// Get custom font
    public static func getCustomFont(weight: FontWeight, size: Double) -> UIFont {
        let fontName = getFontName(weight: weight)
        return UIFont(name: fontName, size: CGFloat(size * fontScale))!
    }
}



