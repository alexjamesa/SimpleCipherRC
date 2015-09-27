//
//  ViewController.swift
//  SimpleCipher
//
//  Created by U3 on 2015-09-26.
//  Copyright © 2015 Ten Kettles Inc. All rights reserved.
//

import UIKit

class SimpleCipherViewController: UIViewController {

    @IBOutlet weak var originalTextField: UITextField!
    @IBOutlet weak var cipherTextField: UITextField!
    
    var viewModel:SimpleCipherViewModel? {
        didSet{
            
            // Subscribe to updates from viewModel about cipherText's value
            viewModel!.cipherText.bindAndFire{
                [unowned self] in
                if self.cipherTextField != nil{
                    self.cipherTextField.text = $0
                }
            }
        }
    }
    
    @IBAction func textValueChanged(sender: UITextField) {
        // Update viewModel when original text changed
        self.viewModel?.originalText=sender.text;
    }
}


