//
//  CodeChallengeTests.swift
//  CodeChallengeTests
//
//  Created by Mohamed Elhamoly on 12/23/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import XCTest
@testable import CodeChallenge

class CurrencyViewModelTest: XCTestCase {
    var sut: CurrencyViewModel?
    var apiServiceMock: APIServiceMock!
    override func setUp() {
        super.setUp()
        apiServiceMock = APIServiceMock()
        sut = CurrencyViewModel(apiService: apiServiceMock)
        
    }
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    
    func test_fetch_Currenies() {
        // Given
        guard let Currenies = StubGenerator().stubCurrency() else {
            XCTFail("Failed to generate Currency")
            return
        }
        
        apiServiceMock.response = Currenies
        sut?.fetchCurreniesList(base: "EUR")
        
        // When
        let values = sut?.lstCurrenies.value
        
        //Assert
        XCTAssertNotNil(values)
        
        
    }
    
    func test_fetch_error() {
        // Given
        
        
        apiServiceMock.error = APIError.invalidResponse.rawValue
        
        sut?.fetchCurreniesList(base: "EUR")
        
        // When
        let value = sut?.error.value
        
        //Assert
        XCTAssertEqual(value, APIError.invalidResponse.rawValue)

        
    }
    
    
}
