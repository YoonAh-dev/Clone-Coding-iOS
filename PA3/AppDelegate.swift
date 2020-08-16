//
//  AppDelegate.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/24.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = MovieViewController()
        window?.makeKeyAndVisible()
        return true
    }



}

