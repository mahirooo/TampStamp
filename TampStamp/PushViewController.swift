//
//  PushViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/18.
//

import UIKit

class PushViewController: UIViewController, UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    var stampNumber = 0
    var stampImage = [String]()
    
    @IBOutlet var StampCollectionView: UICollectionView!
    

    override func viewDidLoad() {
            super.viewDidLoad()
        
        StampCollectionView.delegate = self
        StampCollectionView.dataSource = self
        // ロングプレス
                let longPressGesture =
                    UILongPressGestureRecognizer(target: self,
                        action: #selector(PushViewController.longPress(_:)))
         
                longPressGesture.delegate = self
         
                // Viewに追加.
                self.view.addGestureRecognizer(longPressGesture)
        }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer){
               if sender.state == .began {
                   // 開始は認知される
                   stampImage += ["stampBlue"]
                   StampCollectionView.reloadData()
                   
                   print(stampImage)
               }
               else if sender.state == .ended {
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
                
                // 画像配列の番号で指定された要素の名前の画像をUIImageとする
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
