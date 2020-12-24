//
//  CurrencyConverter.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/23/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class CurrencyConverter: BaseViewController {
    @IBOutlet weak var textCurrencyBase: UITextField!
    @IBOutlet weak var tvCurrenies: UITableView!
    private var cellIdentifier = "CurrencyCell"
    private lazy var bg: DisposeBag = {
        return DisposeBag()
    } ()
    private lazy var currencyVM: CurrencyViewModel = {
        return CurrencyViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

// MARK: init
extension CurrencyConverter {
    func setup()  {
        
        // Loading Observable
        currencyVM.showLoading.asObservable().subscribe(onNext: { [weak self](status) in
            if status {
                self?.showLoading()
            }
            else {
                self?.hideLoading()
                
            }
        }).disposed(by: bg)
        
        // error Observable
        currencyVM.error.asObservable().subscribe(onNext: { [weak self](message) in
            self?.view.makeToast(message)
        }).disposed(by: bg)
        
        // CurrencyBase Observable
        textCurrencyBase.rx.controlEvent([.editingChanged])
            .asObservable().debounce((2), scheduler: MainScheduler.instance)
            
            .subscribe(onNext: { [weak self]_ in
                if self?.textCurrencyBase.text != "" {
                    self?.currencyVM.fetchCurreniesList(base:  (self?.textCurrencyBase.text)!)
                }
            }).disposed(by: bg)
        
        // register CurrencyCell
        tvCurrenies.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        // bind Currenies Data
        bindCurreniesData()
        
        // setupKeyboard()
        setupKeyboard()
    }
}

// MARK:Bind Data
extension CurrencyConverter {
    func bindCurreniesData()  {
        currencyVM.lstCurrenies.asObservable().bind(to: tvCurrenies.rx.items(cellIdentifier:
            cellIdentifier, cellType: CurrencyCell.self )) {(row, element, cell) in
                cell.configure(element)
        }.disposed(by: bg)
    }
    
}
extension CurrencyConverter {
    
    func setupKeyboard()  {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func dismissKeyboard(_ recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
