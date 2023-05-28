//
//  CitiesInteractor.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

class CitiesInteractor: CitiesInteractorProtocol {
    private var allCities: [City] = []
    
    func fetchCities(completion: @escaping (Result<[City], Error>) -> Void) {
        DispatchQueue.global().async { [weak self] in
            if let jsonURL = Bundle.main.url(forResource: "city.list", withExtension: "json"),
               let jsonData = try? Data(contentsOf: jsonURL) {
                do {
                    let cities = try JSONDecoder().decode([City].self, from: jsonData)
                    self?.allCities = cities
                    completion(.success(cities))
                } catch {
                    completion(.failure(error))
                }
            } else {
                let error = NSError()
                completion(.failure(error))
            }
        }
    }
    
    func filterCities(withQuery query: String) -> [City] {
        let lowercaseQuery = query.lowercased()
        let filteredCities = allCities.filter { city in
            return city.name.lowercased().contains(lowercaseQuery)
        }
        return filteredCities
    }
}
