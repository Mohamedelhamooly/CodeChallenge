//
//  Bundle+unitTests.swift
//  CodeChallengeTests
//
//  Created by Mohamed Elhamoly on 12/24/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import XCTest


extension Bundle {
    public class var unitTest: Bundle {
        return Bundle(for: CurrencyViewModelTest.self)
    }
}
