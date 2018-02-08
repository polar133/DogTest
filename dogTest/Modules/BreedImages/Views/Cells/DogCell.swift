//
//  DogCell.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import UIKit
import Kingfisher

class DogCell: UICollectionViewCell {
    
    static let nibName = String(describing: DogCell.self)
    static let identifier = String(describing: DogCell.self)
    
    @IBOutlet var dogImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(urlOrigin: String){
        let url = URL(string: urlOrigin)
        dogImage.kf.setImage(with: url)
    }

}
