//
//  WeatherRouterProtocol.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 25.05.2023.
//

import Foundation

protocol WeatherRouterProtocol{
    static func createModule() -> WeatherView
}
