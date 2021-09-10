//
//  ViewController.swift
//  AvitoTestApp
//
//  Created by Omarov Yerlan on 08.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let networkManager = NetworkManager()
        
    private let tableView: UITableView = {
            let table = UITableView()
            table.register(AppTableViewCell.self,
                           forCellReuseIdentifier: AppTableViewCell.identifier)
            return table
        }()
        
        private var companies = Companies(name: "", employees: [])
        private var viewModels = [AppTableViewCellViewModel]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
            view.backgroundColor = .systemBackground
            
            networkManager.getEmployeeList { [weak self] result in
                switch result {
                case .success(let companies):
                    self?.companies = companies
                    self?.viewModels = companies.employees.compactMap({
                        AppTableViewCellViewModel(
                            name: $0.name,
                            number: $0.phoneNumber,
                            skills: $0.skills.sorted().joined(separator: ", ")
                        )
                    })
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModels.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            title = companies.name
            self.viewModels.sort() { $0.name < $1.name }
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: AppTableViewCell.identifier,
                    for: indexPath
            ) as? AppTableViewCell else {
                fatalError()
            }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    }

