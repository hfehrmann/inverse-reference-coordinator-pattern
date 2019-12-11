//
//  ModalCoordinator.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

protocol ModalCoordinator: Coordinator { }
protocol ModalCoordinatorEscapeHandler: Coordinator { }

class ModalCoordinatorImpl: ModalCoordinator {

    private let parentCoordinator: ModalCoordinatorEscapeHandler
    private weak var rootViewController: UINavigationController?
    private weak var initialController: SecondViewController?

    init(parentCoordinator: ModalCoordinatorEscapeHandler, rootViewController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.rootViewController = rootViewController
    }

    func start() {
        let initialController = SecondViewController(coordinator: self)
        self.rootViewController?.present(initialController, animated: true)
        self.initialController = initialController
    }
}

// MARK: - Coordinator Handle
extension ModalCoordinatorImpl: SecondViewEscapeHandler {
    func didClickEscape() {
        self.initialController?.dismiss(animated: true)
    }

    func handleRandom() {
        self.initialController?.executeRandom()
    }
}
