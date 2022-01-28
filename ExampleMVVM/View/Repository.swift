//
//  Repository.swift
//  ExampleMVVM
//
//  Created by Suhyoung Eo on 2022/01/28.
//

import Foundation

class Repository {
    func fetchNow(completion: @escaping (UtcTimeModel) -> Void) {
        let url = "http://worldclockapi.com/api/json/utc/now"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
            completion(model)
        }.resume()
    }
}

