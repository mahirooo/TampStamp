//
//  CollectionViewCell.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/16.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var rewardLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImageView.layer.cornerRadius = 12
        
        // Initialization code
    }

}
