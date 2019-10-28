//
//  ModalCoordinator.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

protocol SecondCoordinator: AnyObject, Coordinator {
    func handleRandom()
}

class SecondCoordinatorImpl: SecondCoordinator {

    private let coordinator: AppCoordinator
    private weak var rootViewController: UINavigationController?
    private weak var someController: SecondViewController?

    init(coordinator: AppCoordinator, rootViewController: UINavigationController) {
        self.coordinator = coordinator
        self.rootViewController = rootViewController
    }

    func start() {
        let initialController = SecondViewController(coordinator: self)
        self.rootViewController?.present(initialController, animated: false, completion: nil)
    }
}

// MARK: - Coordinator Handle
extension SecondCoordinatorImpl {
    func handleRandom() {
        self.someController?.executeRandom()
    }
}
