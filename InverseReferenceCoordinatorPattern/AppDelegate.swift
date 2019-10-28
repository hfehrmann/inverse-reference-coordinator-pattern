//
//  AppDelegate.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow()

        let initialViewController = UIViewController()
        initialViewController.view.backgroundColor = .white
        window.rootViewController = initialViewController

        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
