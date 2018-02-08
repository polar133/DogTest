//
//  AppDelegate.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootViewController: UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Router.default.setupAppNavigation(appNavigation: DogNavigation())
        window = UIWindow(frame: UIScreen.main.bounds)
        
        rootViewController = UIViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        rootViewController?.presenterVC(NavAvailable.listBreeds)
    }



}

