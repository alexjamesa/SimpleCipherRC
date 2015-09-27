//
//  SimpleCipherViewModel.swift
//  SimpleCipher
//
//  Created by U3 on 2015-09-26.
//  Copyright © 2015 Ten Kettles Inc. All rights reserved.
//

import Foundation

class SimpleCipherViewModel{
    
    var originalText:String?{
        didSet{
            self.model.originalText=originalText
        }
    }
    var cipherText:Dynamic<String?>=Dynamic("")
    let model:SimpleCipherModel
    
    init(model:SimpleCipherModel){
        self.model=model
        
        // Bind cipher variable to model's value
        model.cipherText.bindAndFire{
            [unowned self] in
            self.cipherText.value = $0
        }
    }
    
}