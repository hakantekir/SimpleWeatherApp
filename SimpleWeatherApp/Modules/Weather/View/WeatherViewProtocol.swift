//
//  WeatherViewProtocol.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 25.05.2023.
//

import Foundation

protocol WeatherViewProtocol: AnyObject {
    var weather: Weather? { get set }
    var city: City? { get set }
    func updateWeatherLabels()
}
