//
//  InitialCoordinator.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

protocol InitialCoordinator: AnyObject, Coordinator {
    func handleInitialPush()
}

protocol InitialCoordinatorParent: Coordinator {}

class InitialCoordinatorImpl: InitialCoordinator {

    private let parentCoordinator: InitialCoordinatorParent
    private weak var rootViewController: UINavigationController?

    init(parentCoordinator: InitialCoordinatorParent, rootViewController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.rootViewController = rootViewController
    }

    func start() {
        let initialController = InitialViewController(coordinator: self)
        self.rootViewController?.setViewControllers([initialController], animated: false)
    }
}

// MARK: - Coordinator Handle
extension InitialCoordinatorImpl {
    func handleInitialPush() {
        guard let navigationController = self.rootViewController else { return }
        let secondCoordinator = SecondCoordinatorImpl(
            parentCoordinator: self,
            rootViewController: navigationController
        )
        secondCoordinator.start()
    }
}

extension InitialCoordinatorImpl: SecondCoordinatorParent {
    func didDeinit() {
        debugPrint("Notification on pop to Initial Controller")
    }
}
