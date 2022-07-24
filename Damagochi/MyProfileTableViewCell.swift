//
//  MyProfileTableViewCell.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/24.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    static let identifier = "MyProfileTableViewCell"
    
    func Config() {
        
        leftImageView.tintColor = ColorInfo.fontUIColor
        
        settingLabel.font = .boldSystemFont(ofSize: 13)
        
        rightImageView.image = UIImage(systemName: "chevron.forward")
        rightImageView.tintColor = .systemGray4
        
        self.backgroundColor = ColorInfo.backgroundUIColor
        
        rightLabel.textColor = ColorInfo.fontUIColor
        rightLabel.font = .systemFont(ofSize: 13)
    }
    
}
