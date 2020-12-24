//
//  CurrencyDataViewModel.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/24/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import Foundation

struct CurrencyDataViewModel {
    let code: String
    var symbol: String?
    var amount: Float?
    
    init(code: String, amount: Float) {
        self.code = code
        self.amount = amount
        self.symbol = Utilities.getCurrencySymbol(code)
    }
}
