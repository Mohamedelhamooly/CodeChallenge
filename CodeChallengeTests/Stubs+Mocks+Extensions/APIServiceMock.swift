//
//  APIServiceMock.swift
//  CodeChallengeTests
//
//  Created by Mohamed Elhamoly on 12/24/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import XCTest
import RxSwift
import Alamofire
@testable import CodeChallenge

class APIServiceMock: APIServiceProtocol{
    var response:String?
    var error:String?
    func CallAPIService(funName: String, type: HTTPMethod, parameters: Parameters?, H: HTTPHeaders?) -> Observable<String> {
        
        return Observable.create({ [weak self] (observer) ->  Disposable in
            if self?.response != nil {
                observer.onNext( (self?.response)!)
                
            }
            else if   self?.error  != nil {
                observer.onError(NSError (domain: (self?.error!)!, code: -1, userInfo:nil ))
            }
            
            return Disposables.create {
            }
        })
    }
    

    
    
}
