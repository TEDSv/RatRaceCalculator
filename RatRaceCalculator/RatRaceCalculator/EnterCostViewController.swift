//
//  EnterCostViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 25.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import UIKit

class EnterCostViewController: UIViewController {

    // MARK: - @IBoutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - Variables and Constants
    let calc = CalculatorViewController()
    var funcOfViewController: String = ""
    var enteredValue: Int = 0

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = funcOfViewController
    }

    // MARK: - @IBAction Functions
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let text = textField.text, let enteredValue = Int(text) else {
            return
        }

        if funcOfViewController == "EnterRandomIncome" {
            calc.randomIncome = enteredValue
        } else if funcOfViewController == "EnterUnexpectedExpeses" {
            calc.unexpectedExpeses = enteredValue
        } else {
            return
        }
    }
    // MARK: - END
}
