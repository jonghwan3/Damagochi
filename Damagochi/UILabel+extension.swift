//
//  UILabel+extension.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/24.
//

import UIKit

extension UILabel {
    
    func damagochiNameStyle() {
        self.textAlignment = .center
        self.font = .boldSystemFont(ofSize: 13)
        self.textColor = ColorInfo.fontUIColor
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorInfo.fontCGColor
        self.backgroundColor = ColorInfo.backgroundUIColor
    }
    
    func damagochiDescriptStyle() {
        self.textAlignment = .center
        self.font = .systemFont(ofSize: 13)
        self.textColor = ColorInfo.fontUIColor
    }
    
    func damagochiInfoStyle() {
        self.textAlignment = .center
        self.font = .boldSystemFont(ofSize: 12)
        self.textColor = ColorInfo.fontUIColor
    }
    
}
