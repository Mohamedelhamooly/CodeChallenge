//
//  API.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/23/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//
import Foundation
import Alamofire
import RxSwift
import ObjectMapper

class APIService:APIServiceProtocol {
    
    
    func CallAPIService(funName : String  , type : HTTPMethod   , parameters:Parameters?, H:HTTPHeaders? ) -> Observable<String>{
        
        let url = APP_URL.apiBaseURL + funName
        var par = parameters
        par!["access_key"] = APP_URL.access_key
        return Observable.create({ [weak self] (observer) ->  Disposable in
            
            let request =  Alamofire.request(url, method: .get, parameters: par, encoding: URLEncoding.default, headers: nil).responseString { response in
                switch response.result {
                case .success(let value):
                    if let resCode = response.response?.statusCode ,resCode == 200  || resCode == 201 || resCode == 204
                    {
                        observer.onNext(value)
                        observer.onCompleted()
                    }
                    else
                    {
                        observer.onError(NSError (domain: value, code: -1, userInfo: nil))
                    }
                    
                case .failure(let error):
                    observer.onError(NSError (domain: error.localizedDescription, code: -1, userInfo: nil))
                
                    
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        })
        
    }
}
