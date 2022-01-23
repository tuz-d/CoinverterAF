//
//  CoinverterManager.swift
//  Coinverter
//
//  Created by Дмитрий on 27.12.2021.
//

import Foundation
import Alamofire

class CoinverterManager {
    
    var requestResult: Double = 0.0
    var roundedResult = "0.0"
    
    let inputCurrencyArray = ["EUR", "USD", "RUB", "AUD", "RSD", "SEK", "CNY", "KZT", "BYR", "CAD", "CHF", "AED", "NOK", "IRR", "UAH", "GBR", "BTC"]
    let outputCurrencyArray = ["EUR", "USD", "RUB", "AUD", "RSD", "SEK", "CNY", "KZT", "BYR", "CAD", "CHF", "AED", "NOK", "IRR", "UAH", "GBR", "BTC"]
    
    let currencyURL = "https://free.currconv.com/api/v7/convert?compact=ultra&"
    let apiKey = "bbbe7e7c14b8a3c6a58f"
    
    func getRates(from initialCurrency: String, to resultCurrency: String) {
        let finalURL = "\(currencyURL)apiKey=\(apiKey)&q=\(initialCurrency)_\(resultCurrency)"
        print(finalURL)
        let request = AF.request(finalURL)
        request.responseString(encoding: .utf8) { request in
            switch request.result {
            case .success(let data):
                if let index = data.range(of: ":")?.upperBound {
                    self.requestResult = Double(data.suffix(from: index).dropLast()) ?? 0.0
            }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func convertCalculations(_ amountToConvertField: String?) {
        if let initialStringValue = amountToConvertField {
            if let inputValue = Double(initialStringValue) {
                let result = inputValue * requestResult
                self.roundedResult = String(round(result * 100) / 100.0)
            }
        }
    }
    
}
