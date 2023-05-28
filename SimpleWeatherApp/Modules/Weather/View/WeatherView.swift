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
    
    let headerView: UIView = {
        let headerView = UIView()
        return headerView
    }()
    
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
    
    var humidityWidget: WidgetView = {
        let widget = WidgetView(radius: 10, borderWidth: 2, color: .black)
        return widget
    }()
    
    var humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.text = "Humidity"
        return humidityLabel
    }()
    
    var humadityValueLabel = UILabel()
    
    var windWidget: WidgetView = {
        let widget = WidgetView(radius: 10, borderWidth: 2, color: .black)
        return widget
    }()
    
    var windLabel: UILabel = {
        let windLabel = UILabel()
        windLabel.text = "Wind"
        return windLabel
    }()
    
    var windSpeedLabel: UILabel = {
        let windSpeedLabel = UILabel()
        windSpeedLabel.text = "Speed"
        return windSpeedLabel
    }()
    
    var windDegreeLabel: UILabel = {
        let windDegreeLabel = UILabel()
        windDegreeLabel.text = "Degree"
        return windDegreeLabel
    }()
    
    var seaLevelWidget: WidgetView = {
        let widget = WidgetView(radius: 10, borderWidth: 2, color: .black)
        return widget
    }()
    
    var seaLevelLabel: UILabel = {
        let seaLevelLabel = UILabel()
        seaLevelLabel.text = "Sea Level"
        return seaLevelLabel
    }()
    
    var seaLevelValueLabel: UILabel = {
        let seaLevelValueLabel = UILabel()
        seaLevelValueLabel.text = "Sea Level"
        return seaLevelValueLabel
    }()
    
    var coordinatesWidget: WidgetView = {
        let widget = WidgetView(radius: 10, borderWidth: 2, color: .black)
        return widget
    }()
    
    var coordinatesLabel: UILabel = {
        let coordinatesLabel = UILabel()
        coordinatesLabel.text = "Coordinates"
        return coordinatesLabel
    }()
    
    var latitudeLabel: UILabel = {
        let latitudeLabel = UILabel()
        latitudeLabel.text = "Latitude"
        return latitudeLabel
    }()
    
    var longitudeLabel: UILabel = {
        let longitudeLabel = UILabel()
        longitudeLabel.text = "Longitude"
        return longitudeLabel
    }()
    
    var footerView: UIView = {
        let footerView = UIView()
        return footerView
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        return descriptionLabel
    }()
    
    let popupView: UIView = {
        let popupView = UILabel()
        popupView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        popupView.layer.cornerRadius = 10
        return popupView
    }()
    
    let messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "Please select a city"
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        return messageLabel
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
            showCitySelectionPopup()
            return
        }
        popupView.isHidden = true
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
        
        let humidity = weather.main?.humidity ?? 0
        humadityValueLabel.text = "\(humidity)%"
        
        windSpeedLabel.text = "Speed: \(weather.wind?.speed ?? 0.0) km/h"
        windDegreeLabel.text = "Degree: \(weather.wind?.deg ?? 0)"
        
        seaLevelValueLabel.text = "Sea Level: " // ?
        
        latitudeLabel.text = "Latitude: \(weather.coord?.lat ?? 0.0)"
        longitudeLabel.text = "Longitude: \(weather.coord?.lon ?? 0.0)"
        
        descriptionLabel.text = weather.weather?[0].description?.capitalized
    }
    
    func showCitySelectionPopup() {
        popupView.isHidden = false
    }

    
    private func setupUI() {
        view.addSubview(headerView)
        headerView.addSubview(cityLabel)
        headerView.addSubview(currentTemperatureLabel)
        headerView.addSubview(feelsTemperatureLabel)
        headerView.addSubview(highLabel)
        headerView.addSubview(lowLabel)
        
        headerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalToSuperview().offset(-30)
            make.height.equalToSuperview().dividedBy(6)
        }
        
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
            make.left.equalTo(40)
        }
        
        highLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lowLabel.snp.centerY)
            make.right.equalTo(-40)
        }
        
        view.addSubview(humidityWidget)
        humidityWidget.addSubview(humidityLabel)
        humidityWidget.addSubview(humadityValueLabel)
        
        humidityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        humadityValueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
        }
        
        humidityWidget.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalToSuperview().dividedBy(10)
        }
        
        view.addSubview(windWidget)
        windWidget.addSubview(windLabel)
        windWidget.addSubview(windSpeedLabel)
        windWidget.addSubview(windDegreeLabel)
        
        windLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        windSpeedLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.right.equalTo(-20)
        }
        
        windDegreeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(20)
            make.right.equalTo(-20)
        }
        
        windWidget.snp.makeConstraints { make in
            make.top.equalTo(humidityWidget.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalToSuperview().dividedBy(7)
        }
        
        view.addSubview(seaLevelWidget)
        seaLevelWidget.addSubview(seaLevelLabel)
        seaLevelWidget.addSubview(seaLevelValueLabel)
        
        seaLevelLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        seaLevelValueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
        }
        
        
        seaLevelWidget.snp.makeConstraints { make in
            make.top.equalTo(windWidget.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalToSuperview().dividedBy(10)
        }
        
        view.addSubview(coordinatesWidget)
        coordinatesWidget.addSubview(coordinatesLabel)
        coordinatesWidget.addSubview(latitudeLabel)
        coordinatesWidget.addSubview(longitudeLabel)
        
        coordinatesLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        latitudeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.right.equalTo(-20)
        }
        
        longitudeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(20)
            make.right.equalTo(-20)
        }
        
        coordinatesWidget.snp.makeConstraints { make in
            make.top.equalTo(seaLevelWidget.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalToSuperview().dividedBy(7)
        }
        
        view.addSubview(footerView)
        footerView.addSubview(descriptionLabel)
        
        footerView.snp.makeConstraints { make in
            make.top.equalTo(coordinatesWidget.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(popupView)
        popupView.addSubview(messageLabel)
        
        popupView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        messageLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
