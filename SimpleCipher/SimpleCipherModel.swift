//
//  SimpleCipherModel.swift
//  SimpleCipher
//
//  Created by U3 on 2015-09-26.
//  Copyright © 2015 Ten Kettles Inc. All rights reserved.
//

import Foundation

class SimpleCipherModel{
    
    var originalText:String?{
        // When new original text received, cipher it!
        didSet{cipherText.value=SimpleCipherModel.cipherForString(originalText)}
    }
    var cipherText:Dynamic<String?>
    
    init(){
        self.cipherText=Dynamic("")
        self.originalText=""
    }

    // This is a mock implementation of the ciphering code. (To the mock code's credit, the cipher is entirely undecipherable.)
    class func cipherForString(originalText:String?)->String?{
        if let text = originalText where text != ""{
            return "4!3thX8$Ao"
        }else{
            return ""
        }
    }
    
}