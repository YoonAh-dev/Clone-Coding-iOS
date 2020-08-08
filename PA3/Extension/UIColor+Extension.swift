//
//  UIColor+Extension.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/02.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit

extension UIColor {
    static var getRandomColor: UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
