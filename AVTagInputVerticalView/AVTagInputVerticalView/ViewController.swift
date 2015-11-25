//
//  ViewController.swift
//  AVTagInputVerticalView
//
//  Created by  on 11/24/15.
//  Copyright © 2015 KZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //view
    @IBOutlet weak var tfInputView: UITextField!
    @IBOutlet weak var viewContainerView: UIView!
    @IBOutlet weak var constraintLeadingBottom: NSLayoutConstraint!

    
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
        constraintLeadingBottom.constant = 300
        self.view.layoutIfNeeded()
        
        self.viewContainerView.addSubview(view)
    }
}

