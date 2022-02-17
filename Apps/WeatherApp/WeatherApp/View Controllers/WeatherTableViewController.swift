//
//  WeatherTableViewController.swift
//  WeatherApp
//
//  Created by Yerlan Omarov on 18.10.2021.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    let weatherNetworkManager = WeatherNetworkManager()
    var locationsArray = [WeatherTableViewCellViewModel]()
    var nameLocationsArray = ["Москва", "Санкт-Петербург", "Уфа", "Казань", "Челябинск"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = mainTitle
        view.backgroundColor = .systemBackground
        self.locationsArray = [WeatherTableViewCellViewModel](repeating: WeatherTableViewCellViewModel(),
                                                              count: nameLocationsArray.count)
        addLocations()
    }
    
    func addLocations() {
        weatherNetworkManager.getLocationsWeather(locationsArray: self.nameLocationsArray) { (index, weather) in
            self.locationsArray[index] = weather
            self.locationsArray[index].name = self.nameLocationsArray[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier,
                                                       for: indexPath) as? WeatherTableViewCell
        else {
            fatalError()
        }
        
        let weather = locationsArray[indexPath.row]
        print(weather.name)
        cell.configure(with: weather)
        return cell
    }

}
