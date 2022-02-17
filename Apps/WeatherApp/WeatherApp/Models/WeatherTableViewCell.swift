//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Yerlan Omarov on 18.10.2021.
//

import UIKit

class WeatherTableViewCellViewModel {
    var name: String = "Location"
    var temperature: Int = 0
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0
    var windSpeed: Double = 0.0
    var tempMin: Int = 0
    var tempMax: Int = 0
    
    var conditionString: String {
        switch condition {
        case "clear":                   return "Ясно"
        case "partly-cloudy":           return "Малооблачно"
        case "cloudy":                  return "Облачно с прояснениями"
        case "overcast":                return "Пасмурно"
        case "drizzle":                 return "Морось"
        case "light-rain":              return "Небольшой дождь"
        case "rain":                    return "Дождь"
        case "moderate-rain":           return "Умеренно сильный дождь"
        case "heavy-rain":              return "Сильный дождь"
        case "ontinuous-heavy-rain":    return "Длительный сильный дождь"
        case "showers":                 return "Ливень"
        case "wet-snow":                return "Дождь со снегом"
        case "light-snow":              return "Небольшой снег"
        case "snow":                    return "Снег"
        case "snow-showers":            return "Снегопад"
        case "hail":                    return "Град"
        case "thunderstorm":            return "Гроза"
        case "thunderstorm-with-rain":  return "Дождь с грозой"
        case "thunderstorm-with-hail":  return "Гроза с градом"
        default:                        return "Обновление..."
        }
    }
    
    init?(weatherData: Weather) {
        self.temperature = weatherData.fact.temp
        self.conditionCode = weatherData.fact.icon
        self.url = weatherData.info.url
        self.condition = weatherData.fact.condition
        self.pressureMm = weatherData.fact.pressureMm
        self.windSpeed = weatherData.fact.windSpeed
        self.tempMin = weatherData.forecasts.first!.parts.day.tempMin!
        self.tempMax = weatherData.forecasts.first!.parts.day.tempMax!
    }
    
    init() { }
}

class WeatherTableViewCell: UITableViewCell {
    static let identifier = "WeatherTableViewCell"
    
    private let nameLocationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23, weight: .medium)
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    private let temperatureScaleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    /*
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 7
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLocationLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(temperatureScaleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = contentView.frame.size.height
        let width = contentView.frame.size.width
        
        nameLocationLabel.frame = CGRect(
            x: height + 20,
            y: 0,
            width: width - height - 30,
            height: 60
        )
        
        temperatureLabel.frame = CGRect(
            x: height + 20,
            y: 60,
            width: width - height - 30,
            height: height - 60
        )
        
        temperatureScaleLabel.frame = CGRect(
            x: 10,
            y: 5,
            width: height,
            height: height - 10
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLocationLabel.text = nil
        temperatureLabel.text = nil
        temperatureScaleLabel.text = nil
    }
    
    func configure(with viewModel: WeatherTableViewCellViewModel) {
        nameLocationLabel.text = viewModel.name
        temperatureLabel.text = String(viewModel.temperature)
        temperatureScaleLabel.text = "ºC"
        
        /*/// Image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }*/
    }
}
