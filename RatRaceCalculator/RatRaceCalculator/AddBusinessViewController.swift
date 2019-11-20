//
//  AddBusinessViewController.swift
//  RatRaceCalculator
//
//  Created by Admin on 19.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import UIKit

class AddBusinessViewController: UIViewController {

    
    
    @IBOutlet weak var typeBusinessControl: UISegmentedControl!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
//    @IBOutlet weak var
    
    
    var business: Business? {
        let type = businessType.small
        let price = Int(priceTextField.text ?? "0") ?? 0
        let income = Int(incomeTextField.text ?? "0") ?? 0
        
        return Business(type: type, price: price, income: income)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func typeBusinessControlTapped(_ sender: UISegmentedControl) {
        
        let getIndex = typeBusinessControl.selectedSegmentIndex
        
        switch getIndex {
        case 0:
//            business.type =
            businessType.small
        case 1:
            businessType.medium
        case 2:
            businessType.large
        default:
            print("nothing")
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
