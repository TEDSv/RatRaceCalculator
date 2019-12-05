//
//  showAlertMessage.swift
//  RatRaceCalculator
//
//  Created by Admin on 05.12.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {

    static func showAlert(title: String, message: String, from viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
