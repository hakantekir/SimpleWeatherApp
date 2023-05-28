//
//  WeatherInteractor.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

class WeatherInteractor: WeatherInteractorProtocol {
    
    func fetchWeather(cityID: Int, completition: @escaping (Result<Weather, Error>) -> Void) {
        guard let key = ProcessInfo.processInfo.environment["API_KEY"] else {
            return
        }
        let urlString = "https://api.openweathermap.org/data/2.5/weather?APPID=\(key)&units=metric&id=\(String(cityID))"
        NetworkManager.shared.request(url: urlString, method: .get) { (result: Result<Weather, Error>) in
            completition(result)
        }
    }
}
