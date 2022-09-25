//
//  PushViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/18.
//

import UIKit
import RealmSwift

class PushViewController: UIViewController, UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    var stampNumber = 0
    var stampImage:[String] = []
    var todo = String()
    var reward = String()
    var card = String()
    
    let realm = try! Realm()
    
    @IBOutlet var StampCollectionView: UICollectionView!
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var rewardLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!

    override func viewDidLoad() {
            super.viewDidLoad()
        StampCollectionView.delegate = self
        StampCollectionView.dataSource = self
        rewardLabel.text = "ご褒美：\(reward)"
        todoLabel.text = "目標：\(todo)"
        backgroundImageView.image = UIImage(named: card)
        self.StampCollectionView.backgroundColor = UIColor.clear
        let stamp: Stamp? = read()
        
        // ロングプレス
                let longPressGesture =
                    UILongPressGestureRecognizer(target: self,
                        action: #selector(PushViewController.longPress(_:)))
         
                longPressGesture.delegate = self
         
                // Viewに追加.
                self.view.addGestureRecognizer(longPressGesture)
        }
    
    func read() -> Stamp? {
        return realm.objects(Stamp.self).first
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer){
               if sender.state == .began {
                   // 開始は認知される
                   stampImage += ["stampBlue"]
                   if stampImage.count > 10{
                       stampImage = ["stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue"]
                   }
                   StampCollectionView.reloadData()
               }
               else if sender.state == .ended {
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stampImage.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(2) as! UIImageView
        let cellImage = UIImage(named: stampImage[indexPath.row])
                // UIImageをUIImageViewのimageとして設定
                imageView.image = cellImage
                return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // 横方向のスペース調整
        let horizontalSpace:CGFloat = 5

        //セルのサイズを指定。画面上にセルを3つ表示させたいのであれば、デバイスの横幅を3分割した横幅　- セル間のスペース*2（セル間のスペースが二つあるため）
        let cellSize:CGFloat = self.view.bounds.width/3 - horizontalSpace*2

        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
