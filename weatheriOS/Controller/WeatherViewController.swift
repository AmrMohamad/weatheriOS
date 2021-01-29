//
//  ViewController.swift
//  weatheriOS
//
//  Created by Amr Mohamad on 1/24/21.
//  Copyright © 2021 Amr Mohamad. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherConditionImage: UIImageView!
    @IBOutlet weak var temperatureDegreeLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }

    @IBAction func searchAction(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            textField.placeholder = "Type a city name here...."
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
    
}

