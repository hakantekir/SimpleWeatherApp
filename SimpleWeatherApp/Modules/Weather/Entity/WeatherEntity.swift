//
//  WeatherEntity.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

struct Weather: Codable {
    let coord: Coord?
    let weather: [WeatherElement]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

struct Clouds: Codable {
    let all: Int?
}

struct Coord: Codable {
    let lon, lat: Double?
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

struct Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}

struct WeatherElement: Codable {
    let id: Int?
    let main, description, icon: String?
}

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
}
