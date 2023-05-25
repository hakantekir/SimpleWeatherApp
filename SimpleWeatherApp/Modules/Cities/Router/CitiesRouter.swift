//
//  CitiesRouter.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import UIKit

class CitiesRouter: CitiesRouterProtocol {
    weak var view: UIViewController?
    
    static func createModule() -> UIViewController {
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
}
