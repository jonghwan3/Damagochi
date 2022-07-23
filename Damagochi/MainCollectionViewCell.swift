//
//  MainCollectionViewCell.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/23.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    @IBOutlet weak var damagochiImageView: UIImageView!
    @IBOutlet weak var damagochiLabel: UILabel!
    
    func configCell(damagochiData: Damagochi) {
        damagochiImageView.image = damagochiData.damagochiKind.initialImage()
        //damagochiButton.layer.cornerRadius = damagochiButton.bounds.size.width / 2
        
        damagochiLabel.text = damagochiData.damagochiKind.damagochiName()
        damagochiLabel.textAlignment = .center
        damagochiLabel.font = .boldSystemFont(ofSize: 13)
        damagochiLabel.textColor = ColorInfo.fontUIColor
        damagochiLabel.layer.cornerRadius = 4
        damagochiLabel.layer.borderWidth = 1
        damagochiLabel.layer.borderColor = ColorInfo.fontCGColor
        damagochiLabel.backgroundColor = ColorInfo.backgroundUIColor
    }
    
}
