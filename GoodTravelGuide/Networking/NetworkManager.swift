//
//  NetworkManager.swift
//  GoodTravelGuide
//
//  Created by 권정근 on 8/30/24.
//

import Foundation


// MARK: - Constants
struct Constansts {
    
    static let api_KEY = ""
    static let base_URL = ""
    
}

// MARK: - NetworkManager
class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getCommonData(contentId: String, completion: @escaping (Result<[Item], Error>) -> Void) {
        
        guard let url = URL(string: "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=jlK%2B0ig7iLAbdOuTJsnkp6n0RdeEMtGKsw53jEMbKm3PcB7NFTSeUrnXixogiuvNtHQXeqxgV88buRZvTjG73w%3D%3D&numOfRows=1000000&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&keyword=%EA%B0%95%EC%9B%90&contentTypeId=\(contentId)") else  { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
        
            do {
                let results = try JSONDecoder().decode(AttractionResponse.self, from: data)
                completion(.success(results.response.body.items.item))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
