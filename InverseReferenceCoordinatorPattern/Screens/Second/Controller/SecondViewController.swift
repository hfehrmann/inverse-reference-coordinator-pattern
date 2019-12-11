//
//  ModalViewController.swift
//  InverseReferenceCoordinatorPattern
//
//  Created by Hans Fehrmann on 28/10/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

protocol SecondViewEscapeHandler {
    func handleRandom()
    func didClickEscape()
}

class SecondViewController: UIViewController {

    private let coordinator: SecondViewEscapeHandler

    @IBOutlet weak var randomLabel: UILabel!

    init(coordinator: SecondViewEscapeHandler) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.executeRandom()
    }

    @IBAction func didTapRandom() {
        self.coordinator.handleRandom()
    }

    @IBAction func didClickEscape() {
        self.coordinator.didClickEscape()
    }

    func executeRandom() {
        let lowerLetters = "abcdefghijklmnopqrstuvwxyz"
        let upperLetters = lowerLetters.uppercased()
        let numbers = "0123456789"
        let collection = lowerLetters + upperLetters + numbers
        let randomText = (1...20).compactMap { _ in collection.randomElement() }
        self.randomLabel.text = String(randomText)
    }
}
