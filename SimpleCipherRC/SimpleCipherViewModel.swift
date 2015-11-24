import Foundation
import ReactiveCocoa

class SimpleCipherViewModel{
    
    let cipherText=MutableProperty<String>("")
    let model:SimpleCipherModel

    var originalText:String?{
        // Update model when original text changed
        didSet{
            self.model.originalText=originalText
        }
    }

    
    init(model:SimpleCipherModel){
        self.model=model
        cipherText <~ self.model.cipherText
    }
    
}