//
//  CitiesInteractorProtocol.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

protocol CitiesInteractorProtocol {
    func fetchCities(completion: @escaping (Result<[City], Error>) -> Void)
    func filterCities(withQuery query: String) -> [City]
}
