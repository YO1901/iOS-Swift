//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Yerlan Omarov on 18.10.2021.
//

import Foundation
import CoreLocation

struct WeatherNetworkManager {
    func fetchWeather(lattitude: Double, longitude: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        let urlString =
            "https://api.weather.yandex.ru/v2/forecast?lat=\(lattitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: apiHeader)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(Weather.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func getCoordinateFrom(location: String,
                           completion: @escaping(_ coordinate: CLLocationCoordinate2D?,_ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(location) { (placemark, error) in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
    
    func getLocationsWeather(locationsArray: [String], completion: @escaping (Int, WeatherTableViewCellViewModel) -> Void) {
        for (index, item) in locationsArray.enumerated() {
            getCoordinateFrom(location: item) { (coordinate, error) in
                guard let coordinate = coordinate, error == nil else { return }
                fetchWeather(lattitude: coordinate.latitude, longitude: coordinate.longitude) { result in
                    switch result {
                    case .success(let weather):
                        completion(index, WeatherTableViewCellViewModel(weatherData: weather)!)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
