//
//  MainCollectionViewController.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/23.
//

import UIKit
import Toast

enum ViewType {
    case startView
    case changeView
}

class MainCollectionViewController: UICollectionViewController {
    
    static let identifier = "MainCollectionViewController"
    
    let damagochiList = DamagochiInfo().damagochiList
    
    var mainViewType: ViewType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorInfo.backgroundUIColor
        if mainViewType == ViewType.startView {
            title = "다마고치 선택하기"
        } else if mainViewType == ViewType.changeView {
            title = "다마고치 변경하기"
        }
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = UIScreen.main.bounds.width * 0
        let sectionSpacing: CGFloat = UIScreen.main.bounds.width * 0.03
        let width = (UIScreen.main.bounds.width - spacing * 2 - sectionSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        collectionView.collectionViewLayout = layout

    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return damagochiList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        cell.configCell(damagochiData: damagochiList[indexPath.item])
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(damagochiList[indexPath.item].damagochiKind == .notready) {
            view.makeToast("아직 준비중이예요", duration: 1)
        } else {
            view.alpha = 0.7
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: PopupViewController.identifier) as! PopupViewController
            vc.damagochi = damagochiList[indexPath.item]
            vc.parentView = view
            vc.popUpViewType = mainViewType
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
        
    }
    
}
