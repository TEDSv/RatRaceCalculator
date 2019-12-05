//
//  AddBusinessViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 19.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import UIKit

class AddBusinessViewController: UIViewController {

    // MARK: - @IBoutlet
    @IBOutlet weak var typeBusinessControl: UISegmentedControl!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    // MARK: - Variables and Constants
    var business: Business? = Business(type: .small, price: 0, income: 0, countOfImprovement: 0)
    var playerWallet: Int = 0

    // MARK: - viewDidLoad and viewDidAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        typeBusinessControl.removeAllSegments()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let allBusinesses = BusinessType.allCases
        for index in allBusinesses.indices {
            let business = allBusinesses[index]
            typeBusinessControl.insertSegment(withTitle: business.name, at: index, animated: true)
        }
    }

    // MARK: - @IBAction Functions
    @IBAction func typeBusinessControlTapped(_ sender: UISegmentedControl) {
        let index = typeBusinessControl.selectedSegmentIndex

        guard let selectedType = BusinessType(rawValue: index) else {
            assertionFailure("Can not create business type")
            return
        }
        print("Selected business index = \(selectedType)")
        business?.type = selectedType
        // MARK: - #TODO
        // При выборе нового типа бизнеса давать алерт и предлагать продать другие бизнесы
    }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let priceText = priceTextField.text, let price = Int(priceText) else {
            UIAlertController.showAlert(title: "Неверная стоимость бизнеса",
                                        message: "Введите верные значения для стоимости бизнеса",
                                        from: self)
            return
        }

        guard let incomeText = incomeTextField.text, let income = Int(incomeText) else {
            UIAlertController.showAlert(title: "Неверный доход бизнеса",
                                        message: "Введите верные значения для доходности бизнеса",
                                        from: self)
            return
        }

        guard playerWallet > price else {
            UIAlertController.showAlert(title: "Не хватает средств на покупку бизнеса",
                                        message: "Нужно еще немного поработать",
                                        from: self)
            return
        }

        business?.income = income
        business?.price = price
        performSegue(withIdentifier: "unwindFromAddBusiness", sender: nil)
    }
    // MARK: - END
}
