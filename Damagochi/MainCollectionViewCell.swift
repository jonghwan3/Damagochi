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
        damagochiLabel.damagochiNameStyle()
    }
    
}
