//
//  AppDelegate.swift
//  imkit-ios-sdk-v3-demo
//
//  Created by Howard Sun on 2018/9/19.
//  Copyright © 2018年 Howard Sun. All rights reserved.
//

import UIKit
import IMKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


        
        // remove back-button-title of navi-bar
        // ref: https://stackoverflow.com/a/29912585
        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        let attributes = [
            NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!,
            NSAttributedString.Key.foregroundColor: UIColor.clear
        ]
        BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .normal)
        BarButtonItemAppearance.setTitleTextAttributes(attributes, for: .highlighted)
        
        IMKit.authServerURL = URL(string: "https://chat.fangho.com/auth")!
        IMKit.configure(
            clientKey: "fangho_imkit_0412_2018_001_clientkey",
            chatServerURL: URL(string: "https://chat.fangho.com")!
        )
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}

