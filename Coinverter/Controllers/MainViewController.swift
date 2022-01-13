//
//  ViewController.swift
//  Coinverter
//
//  Created by Дмитрий on 19.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let coinverterManager = CoinverterManager()
    private var amountToConvertString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputCurrencyPicker.delegate = self
        outputCurrencyPicker.delegate = self
        inputCurrencyPicker.dataSource = self
        outputCurrencyPicker.dataSource = self
        
        self.hideKeyboard()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard amountToConvert.text != nil else {return}
    }

    @IBOutlet weak var amountToConvert: UITextField!
    
    @IBOutlet weak var inputCurrencyPicker: UIPickerView!
    
    @IBOutlet weak var outputCurrencyPicker: UIPickerView!
    
    @IBAction func convertButton(_ sender: UIButton) {
        coinverterManager.convertCalculations(amountToConvertString)
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.initialCurrencyValue = amountToConvertString
            destinationVC.resultCurrencyValue = coinverterManager.roundedResult
        }
    }
}
//MARK: - UIPickerView methods
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return coinverterManager.inputCurrencyArray.count
        } else {
            return coinverterManager.outputCurrencyArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return coinverterManager.inputCurrencyArray[row]
        } else {
            return coinverterManager.outputCurrencyArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            let pickerCurrency = coinverterManager.inputCurrencyArray[row]
            coinverterManager.inputCurrency = pickerCurrency
        } else if pickerView.tag == 1 {
            let pickerCurrency = coinverterManager.outputCurrencyArray[row]
            coinverterManager.outputCurrency = pickerCurrency
        }
        coinverterManager.getRates()
    }
}
//MARK: - Keyboard hide when tapping around
extension MainViewController {
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

