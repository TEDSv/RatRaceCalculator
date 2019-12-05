//
//  EnterCostViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 25.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import UIKit

class EnterValueViewController: UIViewController {

    // MARK: - @IBoutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - Variables and Constants
    var player = Player()
    var enteredValue: Int = 0

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - @IBAction Functions
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let text = textField.text, let value = Int(text) else {
            UIAlertController.showAlert(title: "Введены неверные значения",
                                        message: "Введите цифры в текстовое поле",
                                        from: self)
            return
        }

        enteredValue = value
        performSegue(withIdentifier: "unwindFromEnterValue", sender: nil)
    }
    // MARK: - END
}
