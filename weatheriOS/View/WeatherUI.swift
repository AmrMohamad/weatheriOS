//
//  WeatherUI.swift
//  weatheriOS
//
//  Created by Amr Mohamad on 13/06/2023.
//  Copyright © 2023 Amr Mohamad. All rights reserved.
//

import UIKit

struct WeatherUI {
    
    let bGImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "Background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "location.magnifyingglass"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.placeholder     = "Search"
        tf.textAlignment   = .right
        tf.font            = UIFont.systemFont(ofSize: 25, weight: .regular)
        tf.minimumFontSize = 12
        tf.backgroundColor = .systemFill
        tf.borderStyle     = .roundedRect
        tf.autocapitalizationType = .words
        tf.returnKeyType = .go
        tf.roundedTextFieldWithShadow(cornerRadius: 15.0)
        tf.attributedPlaceholder = NSAttributedString(string: "Search",
                                                      attributes: [.foregroundColor : UIColor.secondaryLabel])
        return tf
    }()
    
    let searchButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
//        button.tintColor = .label
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return button
    }()
    
    let conditionImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "sun.max"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .label
        return image
    }()
    
    let dgreeSignLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "°C"
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.textAlignment = .right
        return label
    }()
    
    let dgreeValueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21"
        label.font = UIFont.systemFont(ofSize: 80, weight: .black)
        label.textAlignment = .right
        return label
    }()
    
    let cityLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lodon"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }()

//    let blurEffect: UIVisualEffectView = {
//        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(WeatherUI().searchTextField)
//        NSLayoutConstraint.activate([
//            WeatherUI().searchTextField.topAnchor.constraint(equalTo: view.topAnchor),
//            WeatherUI().searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            WeatherUI().searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            WeatherUI().searchTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        return view
//    }()
}

extension UITextField {
    func roundedTextFieldWithShadow(cornerRadius: CGFloat){
     self.layer.cornerRadius = cornerRadius
     self.layer.shadowOffset = CGSize(width: 0.0, height: 16.0)
     self.layer.shadowOpacity = 0.14
     self.layer.shadowRadius = 9.0
    }
}
