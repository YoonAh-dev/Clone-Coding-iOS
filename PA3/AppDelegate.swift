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
        
        let movieVC = MovieViewController()
        movieVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

        let naviVC = UINavigationController()
        naviVC.viewControllers = [movieVC]
        naviVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let movieSearchVC = MovieSearchViewController()
        movieSearchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let naviSearchVC = UINavigationController()
        naviSearchVC.viewControllers = [movieSearchVC]
        naviSearchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let friendListVC = FriendListViewController()
        friendListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([naviVC, naviSearchVC, friendListVC], animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }



}

