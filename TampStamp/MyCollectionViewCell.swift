//
//  MyCollectionViewCell.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/25.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = MyCollectionViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: MyCollectionViewCell.toString, bundle: nil)
    }
    
    @IBOutlet private weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: Model) {
        myImageView.image = UIImage(named: model.imageName)
    }
    
}
