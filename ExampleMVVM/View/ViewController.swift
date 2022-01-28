//
//  ViewController.swift
//  ExampleMVVM
//
//  Created by Suhyoung Eo on 2022/01/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBAction func onYesterday(_ sender: Any) {
        viewModel.moveDay(day: -1)
    }
    
    @IBAction func onNow(_ sender: Any) {
        dateTimeLabel.text = "Loading..."
        viewModel.reload()
    }
    
    @IBAction func onTomorrow(_ sender: Any) {
        viewModel.moveDay(day: 1)
    }
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.dateTimeLabel.text = self?.viewModel.dateTimeString
            }
        }
        
        viewModel.reload()
    }

}

