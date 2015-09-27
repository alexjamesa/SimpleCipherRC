//
//  SimpleCipherViewModel.swift
//  SimpleCipher
//
//  Created by U3 on 2015-09-26.
//  Copyright © 2015 Ten Kettles Inc. All rights reserved.
//

import Foundation

class SimpleCipherViewModel{
    
    var cipherText:Dynamic<String?>=Dynamic("")
    let model:SimpleCipherModel
    
    var originalText:String?{
        // Update model when original text changed
        didSet{self.model.originalText=originalText}
    }
    
    init(model:SimpleCipherModel){
        self.model=model
        
        // Subscribe to updates from model about cipherText's value
        model.cipherText.bindAndFire{
            [unowned self] in
            self.cipherText.value = $0
        }
    }
    
}