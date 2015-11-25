//
//  TagInputView.swift
//  AVTagInputVerticalView
//
//  Created by  on 11/24/15.
//  Copyright © 2015 KZ. All rights reserved.
//

import UIKit

class TagModel : NSObject {
    var tagTitle : String = ""
    var tagIndex : Int = 0
    
    override init() {
        super.init()
    }
    
    init(title: String, index: Int) {
        super.init()
        tagTitle = title
        tagIndex = index
    }
}

protocol TagInputViewDelegate {
    func didSelectTagAtObjectIndex(object : TagModel)
}

class TagInputView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    //view
    @IBOutlet weak var viewContentView: UIView!
    @IBOutlet weak var clvTagView: UICollectionView!
    @IBOutlet weak var clvFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var constraintClvMaxWidth: NSLayoutConstraint!
    
    
    //data
    var delegate : TagInputViewDelegate?
    var arrTags : [TagModel] = []
    var sizingCell: TagCollectionCell?
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        settingView()
    }

    //MARK: - CollectionView Delegate - Datasource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTags.count
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
        cell.lblTagName.text = arrTags[indexPath.row].tagTitle
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        self.delegate?.didSelectTagAtObjectIndex(arrTags[indexPath.row])
    }
    
    //MARK: - View Setting
    func settingView () {
        let cellNib = UINib(nibName: "TagCollectionCell", bundle: nil)
        self.clvTagView.delegate = self
        self.clvTagView.dataSource = self
        self.clvTagView.registerNib(cellNib, forCellWithReuseIdentifier: "TagCollectionCell")
        self.clvTagView.backgroundColor = UIColor.clearColor()
        
        self.sizingCell = (cellNib.instantiateWithOwner(nil, options: nil) as NSArray).firstObject as! TagCollectionCell?
        self.constraintClvMaxWidth.constant = UIScreen.mainScreen().bounds.width
        self.layoutIfNeeded()
    }
    
    func settingData (data : [TagModel]) {
        self.arrTags = data
    }
}
