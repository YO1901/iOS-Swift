//
//  EmailViewController.swift
//  TwoButtonStart
//
//  Created by Yerlan Omarov on 09.03.2022.
//

import UIKit

final class EmailViewController: UIViewController {
    
    private lazy var emailCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailValidateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Validate", for: .normal)
        button.setTitle("Don't push me!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapEmailValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailValidationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for validation..."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEmailCardView()
    }
     
}


// MARK: - Private methods
extension EmailViewController {
    private func addEmailCardView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidateButton)
        emailCardView.addSubview(emailValidationResultLabel)
        
        NSLayoutConstraint.activate([
            emailCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidateButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            emailValidateButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidateButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidationResultLabel.topAnchor.constraint(equalTo: emailValidateButton.bottomAnchor, constant: 16),
            emailValidationResultLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidationResultLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            emailValidationResultLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -16),
        ])
    }
    
    @objc
    private func didTapEmailValidateButton() {
        let regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: emailTextField.text)
        
        emailValidationResultLabel.text = isValid ? "Success" : "There is mistake in the field"
        emailValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

