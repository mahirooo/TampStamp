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
    var saveData: Save!
    
    let realm = try! Realm()
    
    @IBOutlet var StampCollectionView: UICollectionView!
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var rewardLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!

    override func viewDidLoad() {
            super.viewDidLoad()
        StampCollectionView.delegate = self
        StampCollectionView.dataSource = self
        rewardLabel.text = reward
        todoLabel.text = "目標：\(todo)"
        backgroundImageView.image = UIImage(named: card)
        self.StampCollectionView.backgroundColor = UIColor.clear
        self.tabBarController?.tabBar.isHidden = true;
        
        if card == "selectPink2"{
            rewardLabel.textColor = UIColor(red: 0.945, green: 0.356, blue: 0.411, alpha: 1.0)
        }else if card == "selectPink1"{
            rewardLabel.textColor = UIColor(red: 0.752, green: 0.423, blue: 0.517, alpha: 1.0)
        }else if card == "selectBlue"{
            rewardLabel.textColor = UIColor(red: 0.207, green: 0.360, blue: 0.490, alpha: 1.0)
        }
//        let layout = UICollectionViewFlowLayout()
//                //
//                layout.minimumLineSpacing = 30
//                //
//                StampCollectionView.collectionViewLayout = layout
//        let stamp: Stamp? = read()
        
        // ロングプレス
                let longPressGesture =
                    UILongPressGestureRecognizer(target: self,
                        action: #selector(PushViewController.longPress(_:)))
         
                longPressGesture.delegate = self
         
                // Viewに追加.
                self.view.addGestureRecognizer(longPressGesture)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let children = saveData.children
        
        for child in children {
            stampImage.append(child.title)
        }
        StampCollectionView.reloadData()
    }
    
//    func read() -> Stamp? {
//        return realm.objects(Stamp.self).first
//    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer){
               if sender.state == .began {
                   // 開始は認知される
                   if card == "selectBlue"{
                   stampImage += ["stampBlue"]
                   if stampImage.count > 10{
                       stampImage = ["stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue","stampBlue"]
                   }
                   }else if card == "selectPink1"{
                   stampImage += ["stampPink1"]
                   if stampImage.count > 10{
                       stampImage = ["stampPink1","stampPink1","stampPink1","stampPink1","stampPink1","stampPink1","stampPink1","stampPink1","stampPink1","stampPink1"]
                   }
                   }else if card == "stampPink2"{
                       stampImage += ["stampPink2"]
                       if stampImage.count > 10{
                           stampImage = ["stampPink2","stampPink2","stampPink2","stampPink2","stampPink2","stampPink2","stampPink2","stampPink2","stampPink2","stampPink2"]
                       }
                   }
                   
                   
                   StampCollectionView.reloadData()
                   
//                   let parent = Parent()
//                   let children = parent.children
//                   for img in stampImage {
//                       let child = Child()
//                       child.title = img
//                       children.append(child)
//                   }
//                   try! realm.write() {
//                       realm.add(parent)
//                   }
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

        let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 10, height: 10)
            collectionView.collectionViewLayout = layout
        
        
        //セルのサイズを指定。画面上にセルを3つ表示させたいのであれば、デバイスの横幅を3分割した横幅　- セル間のスペース*2（セル間のスペースが二つあるため）
        let cellSize:CGFloat = self.view.bounds.width/5 - horizontalSpace*2

        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    @IBAction func save(){
//        let parent = Parent()
        let children = saveData.children
        try! realm.write() {
            children.removeAll()
        }
        for img in stampImage {
            let child = Child()
            child.title = img
            try! realm.write() {
                children.append(child)
            }
//            children.append(child)
        }
//        try! realm.write() {
//            realm.add(saveData)
//        }
//
        if children.count < 6{
        let alert: UIAlertController = UIAlertController(title: "スタンプを保存",message: "これからも頑張ろう🔥🔥",preferredStyle: .alert)

        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: { action in print("保存したみょ")
                              self.navigationController?.popViewController(animated: true)
            })
            )
        present(alert, animated: true, completion: nil)
        }else if children.count < 9 && children.count > 5{
            let alert: UIAlertController = UIAlertController(title: "スタンプを保存",message: "目標達成まであと少し🥺",preferredStyle: .alert)

            alert.addAction(
                UIAlertAction(title: "OK",
                              style: .default,
                              handler: { action in print("保存したみょ")
                                  self.navigationController?.popViewController(animated: true)
                })
                )
            present(alert, animated: true, completion: nil)
        }
        else{
            let alert: UIAlertController = UIAlertController(title: "🥳目標達成🥳",message: "習慣化できたね！おめでとう🎉",preferredStyle: .alert)

            alert.addAction(
                UIAlertAction(title: "閉じる",
                              style: .default,
                              handler: { action in print("保存したみょ")
                                  self.navigationController?.popViewController(animated: true)
                })
                )
            present(alert, animated: true, completion: nil)
        }
        
        
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
