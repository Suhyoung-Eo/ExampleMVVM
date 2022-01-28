//
//  ViewModel.swift
//  ExampleMVVM
//
//  Created by Suhyoung Eo on 2022/01/28.
//

import Foundation
import RxRelay

class ViewModel {
    
    let dateTimeString = BehaviorRelay(value: "Loading...")
    
    // 아래 내용은 화면에서 보여줘야 할 형태로 가공
    let service = Service()
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: date)
    }
    
    func reload() {
        // model -> ViewModel
        service.fetchNow { [weak self] model in
            guard let self = self else { return }
            let dateString = self.dateToString(date: model.currentDateTime)
            self.dateTimeString.accept(dateString)
        }
    }
    
    func moveDay(day: Int) {
        service.moveDay(day: day)
        dateTimeString.accept(dateToString(date: service.currentModel.currentDateTime))
    }
}
