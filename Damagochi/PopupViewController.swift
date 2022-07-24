//
//  PopupViewController.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/23.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet weak var popUpImageView: UIImageView!
    @IBOutlet weak var popUplabel: UILabel!
    @IBOutlet weak var popUpDescriptionLabel: UILabel!
    @IBOutlet weak var cancleButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var buttonStackView: UIStackView!
    static let identifier = "PopupViewController"
    
    var damagochi: Damagochi?
    var parentView: UIView?
    var popUpViewType: ViewType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.backgroundColor = ColorInfo.backgroundUIColor
        popUpView.layer.cornerRadius = 10
        configView()
    }
    
    func configView() {
        
        popUpImageView.image = damagochi?.damagochiKind.initialImage()
        
        popUplabel.text = damagochi?.damagochiKind.damagochiName()
        popUplabel.damagochiNameStyle()
        
        lineView.layer.borderWidth = 1
        lineView.layer.borderColor = ColorInfo.fontCGColor
        
        popUpDescriptionLabel.text = damagochi?.damagochiKind.damagochiDescript()
        popUpDescriptionLabel.damagochiDescriptStyle()
        
        buttonStackView.layer.borderWidth = 0.3
        buttonStackView.layer.borderColor = ColorInfo.fontCGColor
        
        cancleButton.setTitle("취소", for: .normal)
        cancleButton.titleLabel?.font = .systemFont(ofSize: 13)
        cancleButton.titleLabel?.textAlignment = .center
        cancleButton.setTitleColor(ColorInfo.fontUIColor, for: .normal)
        cancleButton.backgroundColor = .systemGray5
        cancleButton.layer.cornerRadius = 10
        cancleButton.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        if popUpViewType == .startView {
            startButton.setTitle("시작하기", for: .normal)
        } else if popUpViewType == .changeView {
            startButton.setTitle("변경하기", for: .normal)
        }
        startButton.titleLabel?.font = .systemFont(ofSize: 13)
        startButton.titleLabel?.textAlignment = .center
        startButton.setTitleColor(ColorInfo.fontUIColor, for: .normal)
    }
    @IBAction func cancleButtonClicked(_ sender: UIButton) {
        parentView?.alpha = 1
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        if popUpViewType == .startView {
            UserDefaults.standard.set(true, forKey: UserDefaultsKeyInfo.isDamagochiSelected)
            UserDefaults.standard.set("대장", forKey: UserDefaultsKeyInfo.myName)
            UserDefaults.standard.set(damagochi?.rice, forKey: UserDefaultsKeyInfo.damagochiRice)
            UserDefaults.standard.set(damagochi?.water, forKey: UserDefaultsKeyInfo.damagochiWater)
            UserDefaults.standard.set(damagochi?.damagochiKind.rawValue, forKey: UserDefaultsKeyInfo.damagochiKindRawValue)
        } else if popUpViewType == .changeView {
            UserDefaults.standard.set(damagochi?.damagochiKind.rawValue, forKey: UserDefaultsKeyInfo.damagochiKindRawValue)
        }
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: MyDamagochiViewController.identifier) as! MyDamagochiViewController
        let nv = UINavigationController.init(rootViewController: vc)
        nv.modalPresentationStyle = .fullScreen
        self.present(nv, animated: true)
        
    }
    

}
