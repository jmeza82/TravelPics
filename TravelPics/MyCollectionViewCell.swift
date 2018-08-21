//
//  MyCollectionViewCell.swift
//  TravelPics
//
//  Created by Juan Meza on 12/30/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        
        pictureImgView.layer.cornerRadius = 5
        pictureImgView.clipsToBounds = true
    }
    
}
