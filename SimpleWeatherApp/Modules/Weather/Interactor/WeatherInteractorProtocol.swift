//
//  WeatherInteractorProtocol.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 25.05.2023.
//

import Foundation

protocol WeatherInteractorProtocol {
    func fetchWeather(cityID: Int, completition: @escaping (Result<Weather, Error>) -> Void)
}
