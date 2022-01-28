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
        guard let yesterday = Calendar.current.date(byAdding: .day,
                                                    value: -1,
                                                    to: currentDateTime) else {
            return
        }
        currentDateTime = yesterday
        updateDateTime()
    }
    
    @IBAction func onNow(_ sender: Any) {
       fetchNow()
    }
    
    @IBAction func onTomorrow(_ sender: Any) {
        guard let tomorrow = Calendar.current.date(byAdding: .day,
                                                    value: +1,
                                                    to: currentDateTime) else {
            return
        }
        currentDateTime = tomorrow
        updateDateTime()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNow()
    }
    
    var currentDateTime = Date()
    
    private func fetchNow() {
        let url = "http://worldclockapi.com/api/json/utc/now"
        
        dateTimeLabel.text = "Loading..."
        
        URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: model.currentDateTime) else { return }
            
            self?.currentDateTime = now
            
            DispatchQueue.main.async {
                self?.updateDateTime()
            }
        }.resume()
    }
    
    private func updateDateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        dateTimeLabel.text = formatter.string(from: currentDateTime)
    }
}

//MARK: - Model

struct UtcTimeModel: Codable {
    let id: String
    let currentDateTime: String
    let utcOffset: String
    let isDayLightSavingsTime: Bool
    let dayOfTheWeek: String
    let timeZoneName: String
    let currentFileTime: Int
    let ordinalDate: String
    let serviceResponse: String?

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case currentDateTime
        case utcOffset
        case isDayLightSavingsTime
        case dayOfTheWeek
        case timeZoneName
        case currentFileTime
        case ordinalDate
        case serviceResponse
    }
}
