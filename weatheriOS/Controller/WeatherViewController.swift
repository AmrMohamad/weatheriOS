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
        
    }

    @IBAction func searchAction(_ sender: UIButton) {
        
    }
    
}

