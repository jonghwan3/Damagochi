//
//  MyNameViewController.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/25.
//

import UIKit

class MyNameViewController: UIViewController {
    
    static let identifier = "MyNameViewController"
    @IBOutlet weak var nameTextField: UITextField!
    var myName: String = UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName) ?? "OO"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorInfo.backgroundUIColor
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backBarButtonClicked))
//
        
        navigationItem.title = "\(myName)님 이름 정하기"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveMyName))
        
        nameTextField.text = myName
        nameTextField.textColor = ColorInfo.fontUIColor
        nameTextField.font = .boldSystemFont(ofSize: 15)
        
    }
    
    @objc func saveMyName() {
        if (2...6).contains(nameTextField?.text?.count ?? 0) == true {
            UserDefaults.standard.set(nameTextField.text, forKey: UserDefaultsKeyInfo.myName)
            backBarButtonClicked()
        } else {
            view.makeToast("이름은 2글자 이상 6글자 이하로 해주세요", position: .center)
        }
    }
    
    @objc func backBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
