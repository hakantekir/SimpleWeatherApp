//
//  WeatherView.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 24.05.2023.
//

import UIKit
import SnapKit

class WeatherView: UIViewController, WeatherViewProtocol {
    var presenter: WeatherPresenter?
    
    var city: City?
    var weather: Weather?
    
    var cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.text = "City"
        cityLabel.font = .boldSystemFont(ofSize: 24)
        return cityLabel
    }()
    
    var currentTemperatureLabel: UILabel = {
        let currentTemperatureLabel = UILabel()
        currentTemperatureLabel.text = "Current"
        return currentTemperatureLabel
    }()
    
    var feelsTemperatureLabel: UILabel = {
        let feelsTemperatureLabel = UILabel()
        feelsTemperatureLabel.text = "Feels Like"
        return feelsTemperatureLabel
    }()
    
    var highLabel: UILabel = {
        let highLabel = UILabel()
        highLabel.text = "H"
        return highLabel
    }()
    
    var lowLabel: UILabel = {
        let lowLabel = UILabel()
        lowLabel.text = "L"
        return lowLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateCityLabel()
    }
    
    func updateCityLabel() {
        guard let city = city else {
            return
        }
        cityLabel.text = city.name
        presenter?.fetchWeather(cityId: city.id)
    }
    
    func updateWeatherLabels() {
        guard let weather = weather else {
            return
        }
        
        let currentTemp = Int(weather.main?.temp ?? 0.0)
        currentTemperatureLabel.text = "Current: \(currentTemp)°C"
        
        let feelsLikeTemp = Int(weather.main?.feelsLike ?? 0.0)
        feelsTemperatureLabel.text = "Feels Like: \(feelsLikeTemp)°C"
        
        let highTemp = Int(weather.main?.tempMax ?? 0.0)
        highLabel.text = "High: \(highTemp)°C"
        
        let lowTemp = Int(weather.main?.tempMin ?? 0.0)
        lowLabel.text = "Low: \(lowTemp)°C"
    }
        
    private func setupUI() {
        view.addSubview(cityLabel)
        view.addSubview(currentTemperatureLabel)
        view.addSubview(feelsTemperatureLabel)
        view.addSubview(highLabel)
        view.addSubview(lowLabel)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        currentTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
        feelsTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(currentTemperatureLabel.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
        lowLabel.snp.makeConstraints { make in
            make.top.equalTo(feelsTemperatureLabel.snp.bottom).offset(3)
            make.centerX.equalToSuperview().multipliedBy(0.7)
        }
        
        highLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lowLabel.snp.centerY)
            make.centerX.equalToSuperview().multipliedBy(1.3)
        }
    }
}
