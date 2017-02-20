//
//  AppDelegate.swift
//  RaiseRED
//
//  Created by Bryan Evans Evans on 2/19/17.
//  Copyright © 2017 BSB-FBGM-B. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    override init() {
        super.init()
        // Firebase Init
        if FIRApp.defaultApp() == nil {
            FIRApp.configure()
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Fabric.with([Twitter.self])
        FIRAuth.auth()?.signInAnonymously() { (user, error) in
            // ...
        }
        UIApplication.shared.statusBarStyle = .lightContent
        UITabBar.appearance().tintColor = UIColor(red: 227/255, green: 27/255, blue: 35/255, alpha: 1.0)
        let navigationBarAppearace = UINavigationBar.appearance()

        navigationBarAppearace.barTintColor = UIColor(hue: 0, saturation: 4/255, brightness: 21/255, alpha: 1.0)
        navigationBarAppearace.tintColor = UIColor.white
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

