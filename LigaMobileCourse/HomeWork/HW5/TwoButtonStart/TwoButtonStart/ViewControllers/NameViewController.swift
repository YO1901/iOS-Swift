//
//  NameViewController.swift
//  TwoButtonStart
//
//  Created by Yerlan Omarov on 09.03.2022.
//

import UIKit

final class NameViewController: UIViewController {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var validateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Validate", for: .normal)
        button.setTitle("Don't push me!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var validationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for validation..."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCardView()
    }
    
}


// MARK: - Private methods
extension NameViewController {
    private func addCardView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(cardView)
        cardView.addSubview(nameTextField)
        cardView.addSubview(validateButton)
        cardView.addSubview(validationResultLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            nameTextField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            validateButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validateButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validationResultLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 16),
            validationResultLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validationResultLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            validationResultLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
        ])
    }
    
    @objc
    private func didTapValidateButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)
        
        validationResultLabel.text = isValid ? "Success" : "There is mistake in the field"
        validationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}
