//
//  CustomCollectionViewCell.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/24.
//


import UIKit

protocol CustomCollectionViewCellDelegate: AnyObject {
    func showDetail(cell: CustomCollectionViewCell)
}

class CustomCollectionViewCell: UICollectionViewCell {
    weak var delegate: CustomCollectionViewCellDelegate?
    @IBOutlet weak var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(card: Card) {
        let image = UIImage(named: "stampBlue")
        imageview.image = image
    }
}
