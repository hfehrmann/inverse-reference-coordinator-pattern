//
//  InitialViewController.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {

    private let coordinator: InitialCoordinator

    init(coordinator: InitialCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func didClickInPushMe() {
        self.coordinator.handleInitialPush()
    }
}
