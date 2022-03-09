//
//  ViewController.swift
//  TwoButtonStart
//
//  Created by Yerlan Omarov on 07.03.2022.
//

import UIKit

final class ViewController: UIViewController {

    lazy var nameButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Name screen", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(openNameView), for: .touchUpInside)
        
        return button
    }()

    lazy var emailButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Email screen", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(openEmailView), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonsToView()
    }
    
}


// MARK: - Private methods
extension ViewController {
    private func addButtonsToView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameButton)
        view.addSubview(emailButton)
        
        NSLayoutConstraint.activate([
            nameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 20),
            nameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameButton.heightAnchor.constraint(equalToConstant: 75),
            
            emailButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 50),
            emailButton.leadingAnchor.constraint(equalTo: nameButton.leadingAnchor),
            emailButton.trailingAnchor.constraint(equalTo: nameButton.trailingAnchor),
            emailButton.heightAnchor.constraint(equalTo: nameButton.heightAnchor)
        ])
    }
    
    @objc
    private func openNameView() {
        let nameViewController = NameViewController()
        navigationController?.present(nameViewController, animated: true)
    }
    
    @objc
    private func openEmailView() {
        let emailViewController = EmailViewController()
        navigationController?.pushViewController(emailViewController, animated: true)
    }
}

