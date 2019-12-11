//
//  ModalCoordinator.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

protocol SecondCoordinator: Coordinator { }
protocol SecondCoordinatorEscapeHandler: Coordinator {
    func didDeinit()
}

class SecondCoordinatorImpl: SecondCoordinator {

    private let parentCoordinator: SecondCoordinatorEscapeHandler
    private weak var rootViewController: UINavigationController?
    private weak var someController: SecondViewController?

    deinit {
        self.parentCoordinator.didDeinit()
    }

    init(parentCoordinator: SecondCoordinatorEscapeHandler, rootViewController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.rootViewController = rootViewController
    }

    func start() {
        let initialController = SecondViewController(coordinator: self)
        self.rootViewController?.pushViewController(initialController, animated: true)
        self.someController = initialController
    }
}

// MARK: - Coordinator Handle
extension SecondCoordinatorImpl: SecondViewEscapeHandler {
    func didClickEscape() {
        self.rootViewController?.popViewController(animated: true)
    }

    func handleRandom() {
        self.someController?.executeRandom()
    }
}
