//
//  CurrencyCell.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/24/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    @IBOutlet weak var codeLabel:UILabel!
    @IBOutlet weak var amountLabel :UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    internal func configure(_ currencyDataViewModel : CurrencyDataViewModel) {
        codeLabel.text = "\(currencyDataViewModel.code)"
        if let amount = currencyDataViewModel.amount, let symbol = currencyDataViewModel.symbol{
            amountLabel.text = "\(symbol) \(amount)"
        }
    }
}
