//
//  ViewController.swift
//  TConverter
//
//  Created by Vyacheslav Pavlov on 03.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var forenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 50
            
            slider.minimumTrackTintColor = .blue
            slider.maximumTrackTintColor = .red
            slider.thumbTintColor = .green
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let celsiusTemperature = sender.value
        celsiusLabel.text = String(format: "%.1fºC", celsiusTemperature)
        
        let forenheitTemperature = sender.value * 5 / 9 + 32
        forenheitLabel.text = String(format: "%.1fºF", forenheitTemperature)
    }
    
    override func viewDidLoad() {
        print(slider.value)
        celsiusLabel.text = String(format: "%.1fºC", slider.value)
        forenheitLabel.text = String(format: "%.1fºF", slider.value * 5 / 9 + 32)
    }
}

