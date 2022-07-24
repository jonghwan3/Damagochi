//
//  MyDamagochiViewController.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/24.
//

import UIKit
import Toast

class MyDamagochiViewController: UIViewController {
    
    @IBOutlet weak var ballonLabel: UILabel!
    @IBOutlet weak var ballonImageView: UIImageView!
    @IBOutlet weak var damagochiImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var damagochiInfoLabel: UILabel!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    static let identifier = "MyDamagochiViewController"
    var userDamagochiKindRawValue = UserDefaults.standard.integer(forKey: UserDefaultsKeyInfo.damagochiKindRawValue)
    var userDamagochiRice = UserDefaults.standard.integer(forKey: UserDefaultsKeyInfo.damagochiRice)
    var userDamagochiWater = UserDefaults.standard.integer(forKey: UserDefaultsKeyInfo.damagochiWater)
    var damagochiData: Damagochi?
    var maxRice = 100
    var maxWater = 50
//
    var dialogueList = [
        "안녕하세요? \(UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO")님~",
        "복습 아직 안하셨다구요? 지금 잠이 오세여? \(UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO")님?",
        "\(UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO")님? 새벽 3시까지 하신거예요?",
        "다음에 만들고 싶은 앱은 무엇인가요?",
        "로또번호를 알려드립니다~ \(Int.random(in: 1...50)), \(Int.random(in: 1...50)), \(Int.random(in: 1...50)), \(Int.random(in: 1...50)), \(Int.random(in: 1...50)), \(Int.random(in: 1...50)), \(Int.random(in: 1...50))",
        "돌아오세요~~ 시작할께요~~ 화면 켜주세요~~",
        "\(UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO")님? git에 commit은 하셨겠죠?"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorInfo.backgroundUIColor
        damagochiData = Damagochi(damagochiKind: getDamagochiKind(rawValue: userDamagochiKindRawValue), rice: userDamagochiRice, water: userDamagochiWater)
        navigationConfig()
        viewConfig()
    }
    
    func getDamagochiKind(rawValue: Int) -> DamagochiKind {
        switch rawValue {
        case 1: return DamagochiKind.dagum
        case 2: return DamagochiKind.bangsil
        case 3: return DamagochiKind.banjack
        default: return DamagochiKind.notready
        }
    }
    
    func navigationConfig() {
        self.navigationController?.navigationBar.tintColor = ColorInfo.fontUIColor
        
        navigationItem.title = "\(UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO")님의 다마고치"
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: ColorInfo.fontUIColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(profileButtonClicked))
    }
    
    @objc func profileButtonClicked() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: MyProfileTableViewController.identifier) as! MyProfileTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func viewConfig() {
        riceTextField.keyboardType = .numberPad
        waterTextField.keyboardType = .numberPad
        
        ballonLabel.text = "안녕하세요? \(UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO")님~"
        ballonLabel.damagochiInfoStyle()
        
        ballonImageView.image = UIImage(named: "bubble")
        
        nameLabel.text = damagochiData?.damagochiKind.damagochiName()
        nameLabel.damagochiNameStyle()
        
        setDamagochiInfo()
        damagochiInfoLabel.damagochiInfoStyle()
        
        riceButton.setTitle("밥먹기", for: .normal)
        riceButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        riceButton.eatButtonStyle()
        
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        waterButton.eatButtonStyle()
    }
    @IBAction func riceButtonClicked(_ sender: UIButton) {
        if riceTextField.text == "" || riceTextField.text == nil {
            UserDefaults.standard.set(damagochiData!.rice+1, forKey: UserDefaultsKeyInfo.damagochiRice)
            damagochiData?.rice = UserDefaults.standard.integer(forKey: UserDefaultsKeyInfo.damagochiRice)
            ballonLabel.text = dialogueList.randomElement()
            setDamagochiInfo()
        } else if Int(riceTextField.text!) == nil {
            ballonLabel.text = "숫자만 입력해주세요"
        } else if Int(riceTextField.text!)! >= maxRice {
            ballonLabel.text = "이렇게 많이는 못 먹어요..."
            view.makeToast("밥은 100개 이상 못 먹어요..", position: .center)
        } else if Int(riceTextField.text!)! <= 0 {
            ballonLabel.text = "먹는 걸로 장난치지마라..."
        } else {
            UserDefaults.standard.set(damagochiData!.rice+Int(riceTextField.text!)!, forKey: UserDefaultsKeyInfo.damagochiRice)
            damagochiData?.rice = UserDefaults.standard.integer(forKey: UserDefaultsKeyInfo.damagochiRice)
            ballonLabel.text = dialogueList.randomElement()
            setDamagochiInfo()
        }
    }
    @IBAction func waterButtonCliecked(_ sender: UIButton) {
        if waterTextField.text == "" || waterTextField.text == nil {
            UserDefaults.standard.set(damagochiData!.water+1, forKey: UserDefaultsKeyInfo.damagochiWater)
            damagochiData?.water = UserDefaults.standard.integer(forKey: UserDefaultsKeyInfo.damagochiWater)
            ballonLabel.text = dialogueList.randomElement()
            setDamagochiInfo()
        } else if Int(waterTextField.text!) == nil {
            ballonLabel.text = "숫자만 입력해주세요"
        } else if Int(waterTextField.text!)! >= maxWater {
            ballonLabel.text = "이렇게 많이는 못 먹어요..."
            view.makeToast("물은 50개 이상 못 먹어요..", position: .center)
        } else if Int(waterTextField.text!)! <= 0 {
            ballonLabel.text = "먹는 걸로 장난치지마라..."
        } else {
            UserDefaults.standard.set(damagochiData!.water+Int(waterTextField.text!)!, forKey: UserDefaultsKeyInfo.damagochiWater)
            damagochiData?.water = UserDefaults.standard.integer(forKey: UserDefaultsKeyInfo.damagochiWater)
            ballonLabel.text = dialogueList.randomElement()
            setDamagochiInfo()
        }
    }
    
    func setDamagochiInfo() {
        damagochiInfoLabel.text = "LV\(damagochiData!.getLevel()) · 밥알 \(damagochiData!.rice)개 · 물방울 \(damagochiData!.water)개"
        damagochiImageView.image = damagochiData?.levelImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "\(UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO")님의 다마고치"
        ballonLabel.text = dialogueList.randomElement()
    }
}
