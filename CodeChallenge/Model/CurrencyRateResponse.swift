//
//  Currency.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/23/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import Foundation
import ObjectMapper

struct CurrencyRateResponse: Mappable  {
    var base: String?
    var success: Bool?
    var rates: [String:Float]?
    var error : ResponseError?
    
    init?(map: Map) {
        
    }
    init(){}
    mutating func mapping(map: Map) {
        success <- map["success"]
        base <- map["base"]
        rates <- map["rates"]
        error <- map["error"]
        
    }
    
}

struct ResponseError : Mappable {
    var code : Int?
    var type : String?
    
    
    init?(map: Map) {
        
    }
    init(){}
    mutating func mapping(map: Map) {
        code <- map["code"]
        type <- map["type"]
        
    }
}
