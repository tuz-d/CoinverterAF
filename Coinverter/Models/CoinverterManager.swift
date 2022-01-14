//
//  CoinverterManager.swift
//  Coinverter
//
//  Created by Дмитрий on 27.12.2021.
//

import Foundation
import Alamofire

//protocol CoinverterManagerDelegate {
//    func didUpdatePrice(price: String, currency: String)
//    func didFailWithError(error: Error)
//}

class CoinverterManager {
    
    var inputCurrency = "EUR"
    var outputCurrency = "EUR"
    var RequestResult: Double = 0.0
    var roundedResult = "0.0"
    
    let inputCurrencyArray = ["EUR", "USD", "RUB", "AUD", "RSD", "SEK", "CNY", "KZT", "BYR", "CAD", "CHF", "AED", "NOK", "IRR", "UAH", "GBR", "BTC"]
    let outputCurrencyArray = ["EUR", "USD", "RUB", "AUD", "RSD", "SEK", "CNY", "KZT", "BYR", "CAD", "CHF", "AED", "NOK", "IRR", "UAH", "GBR", "BTC"]
    
    let currencyURL = "https://free.currconv.com/api/v7/convert?apiKey=a3ff8300972ba2083243&compact=ultra"
    
    func getRates() {
        let finalURL = "\(currencyURL)&q=\(inputCurrency)_\(outputCurrency)"
        let request = AF.request(finalURL)
        request.responseString(encoding: .utf8) { request in
            switch request.result {
            case .success(let data):
                if let index = data.range(of: ":")?.upperBound {
                    self.RequestResult = Double(data.suffix(from: index).dropLast()) ?? 0.0
                    print(self.RequestResult)
            }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func convertCalculations(_ amountToConvertField: String?) {
        if let initialStringValue = amountToConvertField {
            if let inputValue = Double(initialStringValue) {
                let result = inputValue * RequestResult
                self.roundedResult = String(round(result * 100) / 100.0)
                print(self.roundedResult)
            }
        }
    }
    
}
