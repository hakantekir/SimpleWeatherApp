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
    
    var feelTemperatureLabel: UILabel = {
        let feelTemperatureLabel = UILabel()
        feelTemperatureLabel.text = "Feels Like"
        return feelTemperatureLabel
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
    
    private func setupUI() {
        view.addSubview(cityLabel)
        view.addSubview(currentTemperatureLabel)
        view.addSubview(feelTemperatureLabel)
        view.addSubview(highLabel)
        view.addSubview(lowLabel)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        currentTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
        feelTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(currentTemperatureLabel.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
        lowLabel.snp.makeConstraints { make in
            make.top.equalTo(feelTemperatureLabel.snp.bottom).offset(3)
            make.centerX.equalToSuperview().multipliedBy(0.8)
        }
        
        highLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lowLabel.snp.centerY)
            make.centerX.equalToSuperview().multipliedBy(1.2)
        }
    }
    
    
    
    
}
