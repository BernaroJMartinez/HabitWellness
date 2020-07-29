//
//  CustomHomeButton.swift
//  HabitWellness
//
//  Created by Bernardo Martinez on 7/27/20.
//  Copyright © 2020 Bernardo Martinez. All rights reserved.
//

import UIKit

@IBDesignable
class CustomHomeButton: UIButton {

    @IBInspectable var roundRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = roundRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
