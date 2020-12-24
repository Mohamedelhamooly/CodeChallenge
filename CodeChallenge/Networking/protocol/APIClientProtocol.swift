//
//  APIServiceProtocol.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/23/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift


protocol APIServiceProtocol {
    func CallAPIService(funName : String  , type : HTTPMethod   , parameters:Parameters?, H:HTTPHeaders? ) -> Observable<String>
}

