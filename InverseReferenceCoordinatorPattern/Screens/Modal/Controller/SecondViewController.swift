//
//  ModalViewController.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {

    private let coordinator: SecondCoordinator

    @IBOutlet weak var randomLabel: UILabel!

    init(coordinator: SecondCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func didTapRandom() {
        coordinator.handleRandom()
    }

    func executeRandom() {
        let lowerLetters = "abcdefghijklmnopqrstuvwxyz"
        let upperLetters = lowerLetters.uppercased()
        let numbers = "0123456789"
        let collection = lowerLetters + upperLetters + numbers
        let randomText = (1...20).compactMap { _ in collection.randomElement() }
        randomLabel.text = String(randomText)
    }

}
