//
//  ViewController.swift
//  AVTagInputVerticalView
//
//  Created by  on 11/24/15.
//  Copyright © 2015 KZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, TagInputViewDelegate {

    //view
    @IBOutlet weak var tfInputView: UITextField!

    
    //data
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - TextField Delegate
    func textFieldDidBeginEditing(textField: UITextField) {
        let nib = UINib(nibName: "TagInputView", bundle: NSBundle(forClass: TagInputView.classForCoder()))
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! TagInputView
        view.delegate = self
        var arrData : [TagModel] = []
        for var i : Int = 0; i < 10; i++ {
            let tag : TagModel = TagModel(title: String(format: "tag-%d",i), index: i)
            arrData.append(tag)
        }
        view.settingData(arrData)
        view.clvTagView.reloadData()
        self.view.layoutIfNeeded()
        
        textField.inputAccessoryView = view
    }
    
    //MARK: - TagInputViewDelegate
    func didSelectTagAtObjectIndex(object: TagModel) {
        tfInputView.text?.appendContentsOf(object.tagTitle)
    }
}

