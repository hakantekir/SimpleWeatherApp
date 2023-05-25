//
//  WeatherRouter.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import UIKit

class WeatherRouter: WeatherRouterProtocol {
    weak var view: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = WeatherView()
        let interactor = WeatherInteractor()
        let presenter = WeatherPresenter()
        let router = WeatherRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.view = view
        
        view.title = "Weather"
        view.tabBarItem.image = UIImage(systemName: "cloud.circle")
        return view
    }
}
