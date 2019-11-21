//
//  AddBusinessViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 19.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import UIKit

// MARK: - #TODO
// Запретить вводить что-нибудь кроме цифр



class AddBusinessViewController: UIViewController {
    
    // MARK: - @IBoutlet
    @IBOutlet weak var typeBusinessControl: UISegmentedControl!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    // MARK: - Variables and Constants
    var business: Business? = Business(type: .small, price: 0, income: 0)
    
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
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }


    // MARK: - Other Functions
    private func showAlertMessage(_ message: String) {
        let alert = UIAlertController(title: "Incorrect data!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  segue.identifier == "unwindFromAddBusiness" else {
            return
        }

        guard let priceText = priceTextField.text, let price = Int(priceText) else {
//            showAlertMessage("Please enter valid data for price")
            return
        }

        guard let incomeText = incomeTextField.text, let income = Int(incomeText) else {
//            showAlertMessage("Please enter valid data for income")
            return
        }

        business?.income = income
        business?.price = price
    }
    // MARK: - END
}
