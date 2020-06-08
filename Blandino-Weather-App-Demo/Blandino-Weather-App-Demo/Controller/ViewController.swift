//
//  ViewController.swift
//  Blandino-Weather-App-Demo
//
//  Created by Carlos Blandino on 6/3/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
  
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempTypeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var whiteBackgroundView: UIView!
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteBackgroundView.layer.cornerRadius = 15
        
        weatherManager.delegate = self
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self
        
    }
    @IBAction func locationSearchButtonTapped(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        
    
    }
//MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // need to end editing when user pressed enter and triggers:
        // 1. should end editing to get called first
        // 2. did end editing to get called second
        
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // checking to see if field is valid and puts away the keyboard if so
        if textField.text != "" {
            // put away the keyboard
            return true
        } else {
            textField.placeholder = "Type something"
            // don't put away the keyboard
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // Good place to use what was typed in text field
        // At this point we can reset the text field
        
        if let city = searchTextField.text {
            weatherManager.getWeather(cityName: city)
        }
        searchTextField.text = ""
    }

    
//MARK: - WeatherManagerDelegate
    // background operation
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        //waiting for data
        DispatchQueue.main.async {
            
            self.locationLabel.text = weather.nameOfCity
            self.tempLabel.text = weather.tempStr
            
            //seting up and utilizing external images from the openweather.org
            self.weatherImage.load(with: weather.imageName)
        }
    }
}

//MARK: - extensions
extension UIImageView {
    func load(with url: String) {
        let url = URL(string: url)!
        let data = try? Data(contentsOf: url)
        let image = UIImage(data: data!)
        self.image = image
    }
}
