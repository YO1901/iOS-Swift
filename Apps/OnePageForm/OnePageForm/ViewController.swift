//
//  ViewController.swift
//  OnePageForm
//
//  Created by Yerlan Omarov on 13.03.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var personCellId = "personCell"
    
    private lazy var personTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PersonCell.self, forCellReuseIdentifier: personCellId)
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        personTableView.frame = view.bounds
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}


// MARK: private methods
extension ViewController {
    private func configureView() {
        view.addSubview(personTableView)
        view.addSubview(titleLabel)
        view.addSubview(personCardView)
        view.addSubview(childrenLabel)
        view.addSubview(addChildButton)
        view.addSubview(childrenTableView)
        view.addSubview(clearButton)
        
        if let name = UserDefaults.standard.string(forKey: "personName") {
            personCardView.nameTextField.text = name
        }
        
        if let age = UserDefaults.standard.integer(forKey: "personAge") {
            personCardView.ageTextField.text = age
        }
        
        NSLayoutConstraint.activate([
            childrenTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            childrenTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childrenTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childrenTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: personCellId,
            for: indexPath
        ) as? PersonCardCell else { return UITableViewCell() }
        
        let model = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fonts = UIFont.fontNames(forFamilyName: UIFont.familyNames[indexPath.section])
        cell.textLabel?.text = fonts[indexPath.row]
        cell.textLabel?.font = UIFont(name: fonts[indexPath.row], size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        UIFont.familyNames[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let fonts = UIFont.fontNames(forFamilyName: UIFont.familyNames[section])
        return "Count of fonts \(String(fonts.count))"
    }
}
