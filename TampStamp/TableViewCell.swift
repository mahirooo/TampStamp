//
//  TableViewCell.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/24.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var rewardLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    var stampCount = ["stampBlue"]
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = TableViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: TableViewCell.toString, bundle: nil)
    }
    private var models = [Model]()
    
    
    @IBOutlet private weak var collectionView: UICollectionView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.id)
            }
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    
}

extension TableViewCell: UICollectionViewDelegate {
    
}

extension TableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        let model = models[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
}

extension TableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}

