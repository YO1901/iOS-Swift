//
//  AppTableViewCell.swift
//  AvitoTestApp
//
//  Created by Omarov Yerlan on 08.09.2021.
//

import UIKit

class AppTableViewCellViewModel {
    let name: String
    let number: String
    let skills: String
    
    init(
        name: String,
        number: String,
        skills: String
    ) {
        self.name = name
        self.number = number
        self.skills = skills
    }
}

class AppTableViewCell: UITableViewCell {
    static let identifier = "AppTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23, weight: .medium)
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    private let skillsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(skillsLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = contentView.frame.size.height
        let width = contentView.frame.size.width
        
        nameLabel.frame = CGRect(
            x: 20,
            y: 0,
            width: width,
            height: height / 3
        )
        
        numberLabel.frame = CGRect(
            x: 20,
            y: height / 3,
            width: width,
            height: height / 3
        )
        
        skillsLabel.frame = CGRect(
            x: 20,
            y: 2 * height / 3,
            width: width,
            height: height / 3
        )
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        numberLabel.text = nil
        skillsLabel.text = nil
    }
    
    func configure(with viewModel: AppTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        numberLabel.text = String(viewModel.number)
        skillsLabel.text = viewModel.skills
    }
}
