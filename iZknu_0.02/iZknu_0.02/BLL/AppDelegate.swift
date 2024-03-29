//
//  AppDelegate.swift
//  iZknu_0.02
//
//  Created by Juno on 10/21/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//  git

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        // 5个导航视图
        let huoDongNavigationController = UINavigationController(rootViewController: HuoDongTableViewController())
        huoDongNavigationController.tabBarItem = UITabBarItem(title: "活动", image: UIImage(named: "Cache/tabBarItem0"), selectedImage: UIImage(named: "Cache/tabBarItem0"))

        let sheTuanNavigationController = UINavigationController(rootViewController: SheTuanTableViewController())
        sheTuanNavigationController.tabBarItem = UITabBarItem(title: "社团", image: UIImage(named: "Cache/tabBarItem1"), selectedImage: UIImage(named: "Cache/tabBarItem1"))
        
        let xinDeNavigationController = UINavigationController(rootViewController: XinDeViewController())
        xinDeNavigationController.tabBarItem = UITabBarItem(title: "新的", image: UIImage(named: "Cache/tabBarItem2"), selectedImage: UIImage(named: "Cache/tabBarItem2"))
        
        let liaoTianNavigationController = UINavigationController(rootViewController: LiaoTianTableViewController())
        liaoTianNavigationController.tabBarItem = UITabBarItem(title: "其它", image: UIImage(named: "Cache/tabBarItem3"), selectedImage: UIImage(named: "Cache/tabBarItem3"))
        
        let woDeNavigationController = UINavigationController(rootViewController: WoDeTableViewController())
        woDeNavigationController.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named:"Cache/tabBarItem4"), selectedImage: UIImage(named: "Cache/tabBarItem4"))
        
        
        // 标签栏
        let myTabBarViewController = tabBarViewController()
        myTabBarViewController.viewControllers = [huoDongNavigationController, sheTuanNavigationController, xinDeNavigationController, liaoTianNavigationController, woDeNavigationController]
        
        // 初选择
        myTabBarViewController.selectedIndex = 0
        
        self.window?.rootViewController = myTabBarViewController

        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

