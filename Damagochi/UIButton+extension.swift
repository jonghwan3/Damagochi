//
//  UIButton+extension.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/24.
//

import Foundation
import UIKit

extension UIButton {
    func eatButtonStyle() {
        self.setTitleColor(ColorInfo.fontUIColor, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 12)
        self.titleLabel?.textAlignment = .center
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorInfo.fontCGColor
        self.layer.cornerRadius = 6
        self.tintColor = ColorInfo.fontUIColor
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 8.0, right: 0.0)
    }
}
