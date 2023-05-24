//
//  CitiesViewProtocol.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

protocol CitiesViewProtocol: AnyObject {
    func displayCities(_ cities: [City])
}
