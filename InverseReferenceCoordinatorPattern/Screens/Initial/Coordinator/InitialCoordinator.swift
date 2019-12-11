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
    func handleInitialPresent()
}

protocol InitialCoordinatorEscapeHandler: Coordinator {}

class InitialCoordinatorImpl: InitialCoordinator {

    private let parentCoordinator: InitialCoordinatorEscapeHandler
    private weak var rootViewController: UINavigationController?

    init(parentCoordinator: InitialCoordinatorEscapeHandler, rootViewController: UINavigationController) {
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

    func handleInitialPresent() {
        guard let navigationController = self.rootViewController else { return }
        let modalCoordinator = ModalCoordinatorImpl(
            parentCoordinator: self,
            rootViewController: navigationController
        )
        modalCoordinator.start()
    }
}

extension InitialCoordinatorImpl: SecondCoordinatorEscapeHandler {
    func didDeinit() {
        debugPrint("Notification on pop to Initial Controller")
    }
}

extension InitialCoordinatorImpl: ModalCoordinatorEscapeHandler { }
