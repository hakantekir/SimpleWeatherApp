//
//  CitiesPresenterProtocol.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

protocol CitiesPresenterProtocol {
    var router: CitiesRouterProtocol? { get set }
    
    func viewDidLoad()
    func userDidSelect(city: City)
}
