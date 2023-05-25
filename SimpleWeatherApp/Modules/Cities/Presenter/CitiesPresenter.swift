//
//  CitiesPresenter.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

class CitiesPresenter: CitiesPresenterProtocol {
    weak var view: CitiesViewProtocol?
    var interactor: CitiesInteractorProtocol?
    var router: CitiesRouterProtocol?
    
    func viewDidLoad(){
        fetchCities()
    }
    
    func userDidSelect(city: City) {
        router?.showWeatherView(with: city)
    }
    
    private func fetchCities() {
        interactor?.fetchCities { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cities):
                    self?.view?.displayCities(cities)
                case .failure(let error):
                    print(error)
                    //self?.view?.displayError(error.localizedDescription)
                }
            }
        }
    }
}
