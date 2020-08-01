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
    static var defaultLargeFont: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    static var defaultLargeBold: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .bold)
    }
}
