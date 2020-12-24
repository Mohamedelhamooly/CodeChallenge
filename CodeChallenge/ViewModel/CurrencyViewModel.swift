//
//  CurrencyViewModel.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/24/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

class CurrencyViewModel: NSObject {
    
    /// Local
    let apiService: APIServiceProtocol
    var lstCurrenies = BehaviorRelay<[CurrencyDataViewModel]>(value: [])
    lazy   var showLoading:BehaviorRelay<Bool> = {
        return BehaviorRelay<Bool>(value: true)
    }()
    lazy   var error:BehaviorRelay<String> = {
        return BehaviorRelay<String>(value: "")
    }()
    private lazy var bg: DisposeBag = {
        return DisposeBag()
    } ()
    
    // MARK: - Initializer
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    //MARK: - Private
    private func mapModel(_ models: [String:Float]) {
        let Currenies = models.map { CurrencyDataViewModel(code: $0.key, amount: $0.value)  }.sorted(by: ({ $0.code < $1.code }))
        self.lstCurrenies.accept(Currenies)
    }
    
    /// Get all available currencies list
    func fetchCurreniesList(base:String) {
        
        
        showLoading.accept(true)
        let parameters = ["base":base]
        
        apiService.CallAPIService(funName:Endpoints.currenies.rawValue, type: .get, parameters: parameters, H: nil)
            .subscribe(onNext: {[weak self] (jsonResponse) in
                
                let results : CurrencyRateResponse = Mapper<CurrencyRateResponse>().map(JSONString: jsonResponse )!
                if results.error == nil {
                    if results.rates != nil {
                        self?.mapModel(results.rates!)
                    }
                    else {
                        self?.lstCurrenies.accept([])
                    }
                    
                }
                else {
                    self?.error.accept((results.error?.type)!)
                    self?.lstCurrenies.accept([])
                }
                self?.showLoading.accept(false)
                }
            , onError: { [weak self] (Error) in
                let error = Error as NSError
                self?.error.accept(error.domain)
                self?.showLoading.accept(false)
            }, onCompleted: {
                
        }) {
    }.disposed(by: bg)
        
    }
}
