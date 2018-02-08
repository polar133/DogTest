//
//  BreedsCell.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import UIKit
import LetterAvatarKit
import Shades

class BreedsCell: UITableViewCell {

    static let nibName = String(describing: BreedsCell.self)
    static let identifier = String(describing: BreedsCell.self)
    
    @IBOutlet var breedLabel: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func config(breedName: String){
        self.breedLabel.text = breedName
        
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = breedName.uppercased()
        configuration.singleLetter = true
        avatarImage?.image = UIImage.makeLetterAvatar(withConfiguration: configuration)
    }
    
}
