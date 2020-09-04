//
//  UIFont+Extension.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/26.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit

extension UIFont {
    static var defaultFont: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    static var defaultBold: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    
    static var defaultNormalFont: UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    
    static var defaultNormalBold: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    static var defaultLargeFont: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    static var defaultLargeBold: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    static var defaultXLargeFont: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    static var defaultXLargeBold: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    static var defaultXXLargeFont: UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
    
    static var defaultXXLargeBold: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    static var defaultHeaderFont: UIFont {
        return UIFont.systemFont(ofSize: 30)
    }
    
    static var defaultHeaderBold: UIFont {
        return UIFont.systemFont(ofSize: 30, weight: .bold)
    }
}
