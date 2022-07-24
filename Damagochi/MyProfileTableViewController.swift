//
//  MyProfileTableViewController.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/24.
//

import UIKit

class MyProfileTableViewController: UITableViewController {
    
    static let identifier = "MyProfileTableViewController"
    var leftImageViewList: [UIImage?] = [UIImage(systemName: "pencil"), UIImage(systemName: "moon.fill"), UIImage(systemName: "arrow.clockwise")]
    var settingLabelList = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorInfo.backgroundUIColor
        navigationItem.title = "설정"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backBarButtonClicked))
    }
    
    @objc func backBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 13
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingLabelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier) as! MyProfileTableViewCell
        cell.leftImageView.image = leftImageViewList[indexPath.row]
        cell.settingLabel.text = settingLabelList[indexPath.row]
        if indexPath.row == 0 {
            cell.rightLabel.text = UserDefaults.standard.string(forKey: UserDefaultsKeyInfo.myName)
        } else {
            cell.rightLabel.text = ""
        }
        cell.Config()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: MyNameViewController.identifier) as! MyNameViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: MainCollectionViewController.identifier) as! MainCollectionViewController
            vc.mainViewType = .changeView
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 2 {
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "웅", style: .default) {
                UIAlertAction in
                UserDefaults.standard.removeObject(forKey: UserDefaultsKeyInfo.isDamagochiSelected)
                UserDefaults.standard.removeObject(forKey: UserDefaultsKeyInfo.myName)
                UserDefaults.standard.removeObject(forKey: UserDefaultsKeyInfo.damagochiRice)
                UserDefaults.standard.removeObject(forKey: UserDefaultsKeyInfo.damagochiWater)
                UserDefaults.standard.removeObject(forKey: UserDefaultsKeyInfo.damagochiKindRawValue)
                
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: MainCollectionViewController.identifier) as! MainCollectionViewController
                vc.mainViewType = .startView
                let nv = UINavigationController(rootViewController: vc)
                
                sceneDelegate?.window?.rootViewController = nv
                sceneDelegate?.window?.makeKeyAndVisible()
                
            }
            let no = UIAlertAction(title: "아냐!", style: .cancel)
            alert.addAction(ok)
            alert.addAction(no)
            present(alert, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    

}
