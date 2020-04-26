//
//  AppDelegate.swift
//  PBWeekCalendarExamples
//
//  Created by Pablo Blanco González on 19/04/2020.
//  Copyright © 2020 PabloBlanco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ViewController.loadFromNib()
        let navigationController = UINavigationController.init(rootViewController: viewController)
        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()

        return true
    }
}

