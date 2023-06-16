//
//  WeatherUI.swift
//  weatheriOS
//
//  Created by Amr Mohamad on 13/06/2023.
//  Copyright © 2023 Amr Mohamad. All rights reserved.
//

import UIKit

class WeatherUI {
    
    let bGImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "Background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var locationButton: UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "location.magnifyingglass"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }
    
    var searchTextField: UITextField {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment   = .right
        tf.font            = UIFont.systemFont(ofSize: 25, weight: .regular)
        tf.minimumFontSize = 12
        tf.backgroundColor = .systemFill
        tf.borderStyle     = .roundedRect
        tf.autocapitalizationType = .words
        tf.returnKeyType = .go
        tf.roundedTextFieldWithShadow(cornerRadius: 15.0)
        tf.attributedPlaceholder = NSAttributedString(string: "Search",
                                                      attributes: [.foregroundColor : UIColor.label])
        return tf
    }
    
    var searchButton : UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        //        button.tintColor = .label
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        return button
    }
    
    let conditionImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "sun.max.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image?.withRenderingMode(.alwaysOriginal)
        image.contentMode = .scaleAspectFit
//        image.tintColor = .label
        image.layer.shadowOffset  = CGSize(width: 0.2, height: 0.2)
        image.layer.shadowRadius  = 3.0
        image.layer.shadowOpacity = 0.50
        return image
    }()
    
    let dgreeValueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.textAlignment = .right
        label.layer.shadowOffset  = CGSize(width: 0.2, height: 0.2)
        label.layer.shadowRadius  = 3.0
        label.layer.shadowOpacity = 0.50
        return label
    }()
    
    let cityLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 35, weight: .medium)
        label.layer.shadowOffset  = CGSize(width: 0.2, height: 0.2)
        label.layer.shadowRadius  = 3.0
        label.layer.shadowOpacity = 0.50
        return label
    }()
}

extension UITextField {
    func roundedTextFieldWithShadow(cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOffset = CGSize(width: 0.0, height: 16.0)
        self.layer.shadowOpacity = 0.14
        self.layer.shadowRadius = 9.0
    }
}


