import UIKit
import ReactiveCocoa

extension RACSignal {
    func subscribeNextAs<T>(nextClosure:(T) -> ()) -> () {
        self.subscribeNext {
            (next: AnyObject!) -> () in
            let nextAsT = next as! T
            nextClosure(nextAsT)
        }
    }
}

class SimpleCipherViewController: UIViewController {

    @IBOutlet weak var originalTextField: UITextField!
    @IBOutlet weak var cipherTextField: UITextField!
    var viewModel:SimpleCipherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTextField.rac_textSignal().subscribeNextAs{
            [weak self] (text:String) -> () in
            self!.viewModel?.originalText=text
        }
        self.cipherTextField.rac_text <~ self.viewModel!.cipherText.producer
    }
}