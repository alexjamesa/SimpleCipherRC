import Foundation
import ReactiveCocoa

class SimpleCipherModel{
    
    var originalText:String?{
        // When new original text received, cipher it!
        didSet{cipherText.value=SimpleCipherModel.cipherForString(originalText)}
    }
    
    var cipherText=MutableProperty<String>("")
    static let mockCipher="4!3thX8$Ao"

    // This is a mock implementation of the ciphering code. (To the mock code's credit, the cipher is entirely undecipherable.)
    class func cipherForString(originalText:String?)->String{
        if let text = originalText where text != ""{
            return mockCipher
        }else{
            return ""
        }
    }
    
}