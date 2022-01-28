//
//  ViewController.swift
//  ExampleMVVM
//
//  Created by Suhyoung Eo on 2022/01/28.
//

import UIKit
import RxSwift

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
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.dateTimeString
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { dateTime in
                self.dateTimeLabel.text = dateTime
            })
            .disposed(by: disposeBag)
        
        viewModel.reload()
    }

}

