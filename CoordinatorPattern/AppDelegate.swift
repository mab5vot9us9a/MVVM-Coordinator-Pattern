//
//  AppDelegate.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import UIKit
import os

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    static var appDelegate: AppDelegate {
        return UIApplication.shared.delegate! as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /* Programmatically initiating the app flow.
         * Delete Main.storyboard and set the Main Interface
         * in your project settings to an empty string -
         * otherwise it will crash */
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = UIColor.red
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        coordinator = AppCoordinator(context: rootViewController)
        coordinator?.start()
        
        os_log("%@", #function)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        os_log("%@", #function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        os_log("%@", #function)
        UserDefaults.standard.set(true, forKey: "locked")
        coordinator?.lockScreen()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        os_log("%@", #function)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        os_log("%@", #function)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        os_log("%@", #function)
    }


}

