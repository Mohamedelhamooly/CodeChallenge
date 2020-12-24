//
//  StubGenerator.swift
//  CodeChallengeTests
//
//  Created by Mohamed Elhamoly on 12/24/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import XCTest
@testable import CodeChallenge


class StubGenerator {
    func stubCurrency() -> String? {
        guard let path = Bundle.unitTest.path(forResource: "stub", ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
     }
        
        let str = String(decoding: data, as: UTF8.self)
        
        return str
    }
}
