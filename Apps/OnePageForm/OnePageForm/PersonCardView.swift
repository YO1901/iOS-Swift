//
//  PersonCardView.swift
//  OnePageForm
//
//  Created by Yerlan Omarov on 13.03.2022.
//

import UIKit

final class PersonCardView: UIView {
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Имя"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Возраст"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
      
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPersonView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}


// MARK: - Private methods
extension PersonCardView {
    private func setupPersonView() {
        self.backgroundColor = .secondarySystemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 12
        
        self.addSubview(nameTextField)
        self.addSubview(ageTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            ageTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ageTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            ageTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}
