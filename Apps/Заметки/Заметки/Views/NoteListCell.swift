//
//  NoteListCell.swift
//  Заметки
//
//  Created by Yerlan Omarov on 30.03.2022.
//

import UIKit

final class NoteListCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var changeDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var briefTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var attachedImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(titleText: String,
                       changeDateText: String,
                       briefTextText: String,
                       image: UIImage?) {
        titleLabel.text = titleText
        changeDateLabel.text = changeDateText
        briefTextLabel.text = briefTextText
        attachedImage.image = image
    }
}

// MARK: - Private methods
extension NoteListCell {
    private func initCell() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(changeDateLabel)
        contentView.addSubview(briefTextLabel)
        contentView.addSubview(attachedImage)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            changeDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            changeDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            changeDateLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            changeDateLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            changeDateLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            
            briefTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            briefTextLabel.leadingAnchor.constraint(equalTo: changeDateLabel.leadingAnchor, constant: 20),
            briefTextLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            briefTextLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            briefTextLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            
            attachedImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            attachedImage.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            attachedImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            attachedImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

