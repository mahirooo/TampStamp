//
//  ViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/16.
//

import UIKit
import RealmSwift
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet var horizontalCollectionView: UICollectionView!
    
    

    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!
    
    let realm = try! Realm()
    var saveItem: Results<Save>!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewWidth = view.frame.width
        viewHeight = view.frame.height
        navHeight = self.navigationController?.navigationBar.frame.size.height

        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        UITabBar.appearance().tintColor = UIColor(red: 0.945, green: 0.356, blue: 0.411, alpha: 1.0)
        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
        horizontalCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        let realm = try! Realm()
        self.saveItem = realm.objects(Save.self)
        horizontalCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(Save())
        self.horizontalCollectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let userData = realm.objects(Save.self)
        
        return userData.count
//        cellの数を決める
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let save: Save = self.saveItem[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 30
        cell.layer.masksToBounds = false
        cell.rewardLabel.text = "ご褒美：\(save.reward)"
        cell.todoLabel.text = "目標：\(save.todo)"
        
        cell.backgroundImageView.image = UIImage(named: save.card)
//        if cell.backgroundImageView.image == UIImage("selectBlue"){
//            cell.rewardLabel.textColor = UIColor(red: 53/255, green: 92/255, blue: 125/255, alpha: 1.0)
//        }else if cell.backgroundImageView.image == UIImage("selectPink1"){
//            cell.rewardLabel.textColor = UIColor(red: 145/255, green: 81/255, blue: 99/255, alpha: 1.0)
//        }else if cell.backgroundImageView.image == UIImage("selectPink2"){
//            cell.rewardLabel.textColor = UIColor(red: 246/255, green: 114/255, blue: 128/255, alpha: 1.0)
//        }
        
        return cell

    }
    
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
            // セルの選択を解除
        collectionView.cellForItem(at: indexPath)
     
            // 別の画面に遷移
            performSegue(withIdentifier: "toNextViewController", sender: saveItem)
        print("選択しました: \(indexPath.row)")
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellWidth = viewWidth/1.1
        cellHeight = viewHeight-690
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            let nextVC = segue.destination as! PushViewController
        let _ = nextVC.view
        nextVC.todo = cell.todoLabel.text
        nextVC.reward = cell.rewardLabel.text
        }

}



