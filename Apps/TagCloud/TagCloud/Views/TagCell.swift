//
//  TagCell.swift
//  TagCloud
//
//  Created by Yerlan Omarov on 05.04.2022.
//

import SnapKit
import Foundation
import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    let customGray = UIColor(red: 196.0 / 255.0,
                             green: 196.0 / 255.0,
                             blue: 196.0 / 255.0,
                             alpha: 1.0)
    
    private lazy var customGradient: CAGradientLayer = {
        let colorTop =  UIColor(red: 238.0 / 255.0,
                                green: 93.0 / 255.0,
                                blue: 106.0 / 255.0,
                                alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 231.0 / 255.0,
                                  green: 130.0 / 255.0,
                                  blue: 254.0 / 255.0,
                                  alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        
        return gradientLayer
    }()
    
    private lazy var tagLabel: UILabel = {
        let tagLabel = UILabel()
        tagLabel.textColor = .white
        tagLabel.backgroundColor = UIColor(white: 1, alpha: 0.0)
        tagLabel.numberOfLines = 0
        tagLabel.layer.cornerRadius = 10
        tagLabel.textAlignment = .center
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        return tagLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: TagModel) {
        layer.cornerRadius = tagLabel.layer.cornerRadius
        layer.masksToBounds = true
        layer.backgroundColor = customGray.cgColor
        tagLabel.text = model.strDrink
        setConstraints()
    }
    
    func changeBackgroundColor() {
        guard let sublayers = layer.sublayers, sublayers.contains(customGradient) else {
            setGradientBackground(toAppear: true)
            return
        }
        setGradientBackground(toAppear: false)
    }
    
    func hasSubstring(text: String) -> Bool {
        guard let strDrink = tagLabel.text else {
            return false
        }
        return strDrink.contains(text)
    }
    
    func setGradientBackground(toAppear: Bool) {
        if toAppear {
            customGradient.frame = tagLabel.bounds
            layer.insertSublayer(customGradient, below: tagLabel.layer)
        } else {
            customGradient.removeFromSuperlayer()
        }
    }
}

// MARK: - Private methods
extension TagCollectionViewCell {
    private func addSubviews() {
        addSubview(tagLabel)
    }
    
    private func setConstraints() {
        tagLabel.snp.makeConstraints { maker in
            maker.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}


// MARK: - LeftAlignmentViewFlowLayout
class LeftAlignmentViewFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 8

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        guard let attributesToReturn =  attributes.map( { $0.copy() }) as?
                [UICollectionViewLayoutAttributes] else {
                return nil
        }
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributesToReturn.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + cellSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributesToReturn
    }
}
