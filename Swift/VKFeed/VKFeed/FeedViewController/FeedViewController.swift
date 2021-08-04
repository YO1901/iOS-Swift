//
//  FeedViewController.swift
//  VKFeed
//
//  Created by Slava Pavlov on 21.07.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        networkService.getFeed()
    }
}
