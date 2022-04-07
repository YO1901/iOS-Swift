//
//  CardCell.swift
//  OnePageForm
//
//  Created by Yerlan Omarov on 15.03.2022.
//

import UIKit

final class PersonCardCell: UITableViewCell {
    
    lazy var personCardView: PersonCardView = {
        let cardView = PersonCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBackground
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Private methods
extension PersonCardCell {
    private func initCell() {
        contentView.addSubview(personCardView)
        contentView.addSubview(deleteButton)

        NSLayoutConstraint.activate([
            personCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            personCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            personCardView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            personCardView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            deleteButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            deleteButton.leadingAnchor.constraint(equalTo: personCardView.trailingAnchor, constant: -20),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            deleteButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

