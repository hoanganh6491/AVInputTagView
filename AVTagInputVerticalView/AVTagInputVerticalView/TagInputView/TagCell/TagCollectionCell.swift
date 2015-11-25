//
//  TagCollectionCell.swift
//  AVTagInputVerticalView
//
//  Created by  on 11/24/15.
//  Copyright © 2015 KZ. All rights reserved.
//

import UIKit

class TagCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblTagName: UILabel!
    @IBOutlet weak var constraintMaxWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        self.lblTagName.textColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        self.layer.cornerRadius = 4
        
        self.constraintMaxWidth.constant = UIScreen.mainScreen().bounds.width - 8 * 2 - 8 * 2
    }
    
    //MARK: - View Utils
    func settingCellContent (str : String) {
        self.lblTagName.text = str
    }
}
