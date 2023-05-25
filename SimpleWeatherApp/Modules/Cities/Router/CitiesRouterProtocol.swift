//
//  CitiesRouterProtocol.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import UIKit

protocol CitiesRouterProtocol {
    var tabBarVC: UITabBarController? { get set }
    
    static func createModule() -> CitiesView
    func showWeatherView(with city: City)
}
