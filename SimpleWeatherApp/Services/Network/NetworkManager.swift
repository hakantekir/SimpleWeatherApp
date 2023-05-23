//
//  NetworkManager.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 23.05.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Decodable>(url: String,
                               method: HTTPMethod,
                               completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, method: method, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
