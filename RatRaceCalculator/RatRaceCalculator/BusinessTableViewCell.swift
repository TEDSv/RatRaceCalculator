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
        // if else с малым средним и большим
        // улучшения должны пропадать на среднем и большом бизнесе
    }

}
