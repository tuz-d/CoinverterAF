//
//  ResultViewController.swift
//  Coinverter
//
//  Created by Дмитрий on 26.12.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var initialCurrencyValue: String?
    var resultCurrencyValue: String?
    var initialCurrency: String?
    var resultCurrency: String?
    
    @IBOutlet weak var initialCurrencyLabel: UILabel!
    @IBOutlet weak var resultCurrencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialCurrencyLabel.text = "\(initialCurrencyValue!) \(initialCurrency!)"
        resultCurrencyLabel.text = "\(resultCurrencyValue!) \(resultCurrency!)"
    }
    
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        let shareText = "\(initialCurrencyValue!) \(initialCurrency!) is \(resultCurrencyValue!) \(resultCurrency!)"
    
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    

}
