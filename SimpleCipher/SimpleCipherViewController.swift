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
            viewModel!.cipherText.bindAndFire{
                [unowned self] in
                if self.cipherTextField != nil{
                    self.cipherTextField.text = $0
                }
            }
        }
    }
    
    @IBAction func textValueChanged(sender: UITextField) {
        self.viewModel?.originalText=sender.text;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}


