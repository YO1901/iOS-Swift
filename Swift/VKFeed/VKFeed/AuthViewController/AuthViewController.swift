//
//  ViewController.swift
//  VKFeed
//
//  Created by Slava Pavlov on 19.07.2021.
//

import UIKit

class AuthViewController: UIViewController {
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .blue
    }

    @IBAction func signinTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}

