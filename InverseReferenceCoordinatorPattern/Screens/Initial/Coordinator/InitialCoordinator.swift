//
//  InitialCoordinator.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

protocol InitialCoordinator: AnyObject, Coordinator {}

class InitialCoordinatorImpl: InitialCoordinator {

    private let coordinator: AppCoordinator
    private weak var rootViewController: UIViewController?

    init(coordinator: AppCoordinator, rootViewController: UIViewController) {
        self.coordinator = coordinator
        self.rootViewController = rootViewController
    }

    func start() {
        let initialController = InitialViewController(coordinator: self)
        self.rootViewController?.present(initialController, animated: false, completion: nil)
    }
}
