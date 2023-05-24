//
//  CityEntity.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

struct City: Decodable {
    let id: Int
    let name, state, country: String
    let coord: Coordinate
}

struct Coordinate: Decodable {
    let lon, lat: Double
}
