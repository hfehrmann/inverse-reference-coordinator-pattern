//
//  Coordinator.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation

protocol Event {}

protocol Coordinator {
    func start()
    func handle(_ event: Event)
}

extension Coordinator {
    func handle(_ event: Event) {
        fatalError("No event handler is provided for this coordinator")
    }
}
