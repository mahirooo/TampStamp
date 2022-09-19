//
//  PushViewController.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/18.
//

import UIKit

class PushViewController: UIViewController, UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    var stampArray = [String]()
    var stampNumber = 0
    let imageName = ["stampBlue"]
    @IBOutlet var stampImage: UIImageView!
    

    override func viewDidLoad() {
            super.viewDidLoad()
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
                   stampArray += ["stampBlue"]
                   
                   print(stampArray)
               }
               else if sender.state == .ended {
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .blue
//        cell.backgroundImageView.image = UIImage(named: imageName[indexPath.row])
        return cell
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
