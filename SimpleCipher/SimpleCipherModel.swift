//
//  SimpleCipherModel.swift
//  SimpleCipher
//
//  Created by U3 on 2015-09-26.
//  Copyright © 2015 Ten Kettles Inc. All rights reserved.
//

import Foundation

class SimpleCipherModel{
    
    // WHEN INPUT RECEIVED, UPDATE OUTPUT
    var originalText:String?{
        didSet{
            cipherText.value=SimpleCipherModel.cipherForString(originalText)
        }
    }
    var cipherText:Dynamic<String?>
    
    init(){
        self.cipherText=Dynamic("")
        self.originalText=""
    }
    
    class func cipherForString(originalText:String?)->String?{
        if let text = originalText where text != ""{
            return "4!3thX8$Ao"
        }else{
            return ""
        }
    }
    
}