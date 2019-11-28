//
//  BusinessTableViewCell.swift
//  RatRaceCalculator
//
//  Created by Admin on 21.11.2019.
//  Copyright © 2019 TED. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countOfImprovementLabel: UILabel!
    @IBOutlet weak var improvementLabel: UILabel!
    @IBOutlet weak var propertyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(with business: Business) {
        incomeLabel.text = "\(business.income)"
        priceLabel.text = "\(business.price)"
        countOfImprovementLabel.text = "\(business.countOfImprovement)"

        if business.type == BusinessType.small {
            typeLabel.text = "Доходы от малого бизнеса:"
            countOfImprovementLabel.isHidden = false
            improvementLabel.isHidden = false
        } else if business.type == BusinessType.medium {
            typeLabel.text = "Доходы от среднего бизнеса:"
            countOfImprovementLabel.isHidden = true
            improvementLabel.isHidden = true
        } else if business.type == BusinessType.large {
            typeLabel.text = "Доходы от крупного бизнеса:"
            countOfImprovementLabel.isHidden = true
            improvementLabel.isHidden = true
        }

        // При выборе другого типа бизнеса предыдущие должны продаваться
    }
}
