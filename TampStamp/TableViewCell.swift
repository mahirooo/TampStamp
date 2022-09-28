//
//  TableViewCell.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/24.
//

import UIKit
import RealmSwift

class TableViewCell: UITableViewCell, UICollectionViewDelegate{
    
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var rewardLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
//    var stampCount: Results<Stamp>!
    var stampImage:[String] = []
    var saveData: Save!
    let realm = try! Realm()
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = TableViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: TableViewCell.toString, bundle: nil)
    }
    private var models = [Model]()
    
    
    @IBOutlet public weak var collectionView: UICollectionView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.id)
        collectionView.delegate = self
                collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.clear
        let layout = UICollectionViewFlowLayout()
                //
                layout.minimumLineSpacing = 16
                //
                collectionView.collectionViewLayout = layout
//                collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.id)
            }
}

extension TableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saveData.children.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        let imageView = cell.viewWithTag(2) as! UIImageView
        let cellImage = UIImage(named: saveData.children[indexPath.row].title)
                // UIImageをUIImageViewのimageとして設定
                imageView.image = cellImage
        return cell
    }
    
}

extension TableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44.9, height: 44.9)
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {

    // セルサイズを指定する
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // 横方向のサイズを調整
        let cellSizeWidth:CGFloat = self.view.frame.width/15
    
        // widthとheightのサイズを返す
        return CGSize(width: cellSizeWidth, height: cellWidth)
    }
}

