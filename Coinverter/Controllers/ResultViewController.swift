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
    
    @IBOutlet weak var initialCurrencyLabel: UILabel!
    @IBOutlet weak var resultCurrencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialCurrencyLabel.text = initialCurrencyValue
        resultCurrencyLabel.text = resultCurrencyValue
    }
    
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        let shareText = "\(initialCurrencyValue!) is \(resultCurrencyValue!)"
    
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    

}
