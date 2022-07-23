//
//  MainCollectionViewController.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/23.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    let damagochiList = DamagochiInfo().damagochiList
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.alpha = 0.8
        view.backgroundColor = ColorInfo.backgroundUIColor
        title = "다마고치 선택하기"
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = UIScreen.main.bounds.width * 0
        let sectionSpacing: CGFloat = UIScreen.main.bounds.width * 0.05
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
    
    func showAlertController() {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        //2. 버튼 만들기
        let start = UIAlertAction(title: "시작하기", style: .destructive, handler: nil)
        let cancle = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        //3. 1+2
        alert.addAction(start)
        alert.addAction(cancle)
        //4. present
        present(alert, animated: true, completion: nil)

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showAlertController()
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: PopupViewController.identifier) as! PopupViewController
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
}
