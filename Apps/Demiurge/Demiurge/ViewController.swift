//
//  ViewController.swift
//  Demiurge
//
//  Created by Yerlan Omarov on 26.01.2022.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    private let livingCellsTableView = UITableView()
    private let createCellButton = UIButton(type: .system)
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        lazy var gradientLayer = CAGradientLayer()
        
        self.view.layer.addSublayer(gradientLayer)
        self.view.addSubview(livingCellsTableView)
        self.view.addSubview(createCellButton)
        
        title = "Клеточное наполнение"
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 50/255, green: 31/255, blue: 77/255, alpha: 1).cgColor,
                                UIColor.black.cgColor]

        livingCellsTableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20))
        }
        
        createCellButton.backgroundColor = UIColor(red: 90/255, green: 52/255, blue: 114/255, alpha: 1)
        createCellButton.setTitle("СОТВОРИТЬ", for: .normal)
        createCellButton.setTitleColor(.white, for: .normal)
        createCellButton.titleLabel?.font = UIFont(name: "Roboto", size: 14)
        createCellButton.layer.cornerRadius = 4
        createCellButton.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.width.equalTo(331)
            make.bottom.equalToSuperview().inset(36)
            make.height.equalTo(36)
        }
    }
}

