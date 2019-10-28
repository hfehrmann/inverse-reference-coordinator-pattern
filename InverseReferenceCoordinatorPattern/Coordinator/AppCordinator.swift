//
//  AppCordinator.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let rootViewController = UIViewController()
        let initialCoordinator = InitialCoordinatorImpl(coordinator: self, rootViewController: rootViewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        initialCoordinator.start()
    }
}