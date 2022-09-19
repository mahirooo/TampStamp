//
//  ViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var horizontalCollectionView: UICollectionView!

    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!

    var photoArray = ["cardDesignBlue","cardDesignPink1","cardDesignPink2","cardDesignBlue","cardDesignPink1","cardDesignPink2"]
    var rewardArray = ["フラペチーノ","スプラ","焼肉","フラペチーノ","スプラ","焼肉"]
    var todoArray = ["腹筋100回","毎日自炊","お風呂掃除","腹筋100回","毎日自炊","お風呂掃除"]

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

    }

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
//        cellの数を決める
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 30
        cell.layer.masksToBounds = false
        cell.rewardLabel.text = "ご褒美：\(rewardArray[indexPath.row])"
        cell.todoLabel.text = "目標：\(todoArray[indexPath.row])"
        cell.backgroundImageView.image = UIImage(named: photoArray[indexPath.row])
        return cell

    }
    
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
            // セルの選択を解除
        collectionView.cellForItem(at: indexPath)
     
            // 別の画面に遷移
            performSegue(withIdentifier: "toNextViewController", sender: nil)
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

}



