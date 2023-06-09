//
//  CitiesRouter.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import UIKit

class CitiesRouter: CitiesRouterProtocol {
    weak var view: UIViewController?
    weak var tabBarVC: UITabBarController?
    
    static func createModule() -> CitiesView {
        let view = CitiesView()
        let interactor = CitiesInteractor()
        let presenter = CitiesPresenter()
        let router = CitiesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.view = view
        
        view.title = "Cities"
        view.tabBarItem.image = UIImage(systemName: "map.circle")
        return view
    }
    
    func showWeatherView(with city: City) {
        guard let tabBarVC = tabBarVC else {
            return
        }
        
        if let weatherView = tabBarVC.viewControllers?.first as? WeatherView {
            weatherView.city = city
            weatherView.updateCityLabel()
        }
        
        tabBarVC.selectedIndex = 0
    }
}
