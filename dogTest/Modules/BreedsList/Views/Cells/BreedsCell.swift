//
//  BreedsCell.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import UIKit

class BreedsCell: UITableViewCell {

    static let nibName = String(describing: BreedsCell.self)
    static let identifier = String(describing: BreedsCell.self)
    
    @IBOutlet var breedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func config(breedName: String){
        self.breedLabel.text = breedName
    }
    
}
