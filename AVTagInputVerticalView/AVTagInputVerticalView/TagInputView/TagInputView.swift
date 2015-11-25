//
//  TagInputView.swift
//  AVTagInputVerticalView
//
//  Created by  on 11/24/15.
//  Copyright © 2015 KZ. All rights reserved.
//

import UIKit

class TagInputView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    //view
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var clvTagView: UICollectionView!
    @IBOutlet weak var clvFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var constraintClvMaxWidth: NSLayoutConstraint!
    
    
    //data
    let TAGS = ["Tech", "Design", "Humor", "Travel", "Music", "Writing", "Social Media", "Life", "Education", "Edtech", "Education Reform", "Photography", "Startup", "Poetry", "Women In Tech", "Female Founders", "Business", "Fiction", "Love", "Food", "Sports"]
    var sizingCell: TagCollectionCell?
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        let cellNib = UINib(nibName: "TagCollectionCell", bundle: nil)
        self.clvTagView.delegate = self
        self.clvTagView.dataSource = self
        self.clvTagView.registerNib(cellNib, forCellWithReuseIdentifier: "TagCollectionCell")
        self.clvTagView.backgroundColor = UIColor.clearColor()
        
        self.sizingCell = (cellNib.instantiateWithOwner(nil, options: nil) as NSArray).firstObject as! TagCollectionCell?
        self.constraintClvMaxWidth.constant = UIScreen.mainScreen().bounds.width
        self.layoutIfNeeded()
        print("alo alo")
    }

    //MARK: - CollectionView Delegate - Datasource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(TAGS.count)
        return TAGS.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let strCellIdentifier : String = "TagCollectionCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(strCellIdentifier, forIndexPath: indexPath) as! TagCollectionCell
        self.configureCell(cell, forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        self.configureCell(self.sizingCell!, forIndexPath: indexPath)
        return self.sizingCell!.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
    }
    
    func configureCell(cell: TagCollectionCell, forIndexPath indexPath: NSIndexPath) {
        let tag = TAGS[indexPath.row]
        cell.lblTagName.text = tag
    }
}
