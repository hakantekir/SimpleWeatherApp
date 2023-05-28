//
//  WeatherPresenter.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import Foundation

class WeatherPresenter: WeatherPresenterProtocol {
    weak var view: WeatherViewProtocol?
    var interactor: WeatherInteractorProtocol?
    var router: WeatherRouterProtocol?
    
    func fetchWeather(cityId: Int) {
        interactor?.fetchWeather(cityID: cityId, completition: { [weak self] result in
            switch result {
            case .success(let weather):
                self?.view?.weather = weather
                self?.view?.updateWeatherLabels()
            case .failure(let error):
                print(error)
            }
        })
    }
}
