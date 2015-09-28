//
//  SimpleCipherTests.swift
//  SimpleCipherTests
//
//  Created by U3 on 2015-09-27.
//  Copyright © 2015 Ten Kettles Inc. All rights reserved.
//

import XCTest
@testable import SimpleCipher

class SimpleCipherTests: XCTestCase {
    
    var viewController:SimpleCipherViewController!
    var viewModel:SimpleCipherViewModel!
    var model:SimpleCipherModel!
    
    override func setUp() {
        super.setUp()
        
        // Create model and viewmodel
        model=SimpleCipherModel()
        viewModel=SimpleCipherViewModel(model:model)

        // Load view controller from storyboard and attach view model
        let storyboard=UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        viewController=storyboard.instantiateInitialViewController() as! SimpleCipherViewController
        viewController.viewModel=viewModel
        viewController.loadView()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // 1a. Test that original text maps correctly from view to viewmodel
    func testViewToViewModelMapping(){
        viewController.originalTextField.text="test"
        viewController.textValueChanged(viewController.originalTextField)
        XCTAssertEqual(viewController.originalTextField.text, viewModel.originalText)
        
        viewController.originalTextField.text=""
        viewController.textValueChanged(viewController.originalTextField)
        XCTAssertEqual(viewController.originalTextField.text, viewModel.originalText)
        
    }
    
    // 1b. Test that original text maps correctly from viewmodel to model
    func testViewModelToModelMapping(){
        viewModel.originalText="test"
        XCTAssertEqual(viewModel.originalText, model.originalText)
        
        viewModel.originalText=""
        XCTAssertEqual(viewModel.originalText, model.originalText)
    }
    
    // 1c. Test that cipher maps correctly from model to viewmodel
    func testModelToViewModelMapping(){
        model.cipherText.value="test"
        XCTAssertEqual(model.cipherText.value, viewModel.cipherText.value);
        
        model.cipherText.value=nil
        XCTAssertEqual(model.cipherText.value, viewModel.cipherText.value);
    }
    
    // 1d. Test that cipher maps correctly from viewmodel to view
    func testViewModeltoViewMapping(){
        viewModel.cipherText.value="test"
        XCTAssertEqual(viewModel.cipherText.value, viewController.cipherTextField.text)
        
        viewModel.cipherText.value=nil
        XCTAssertEqual("", viewController.cipherTextField.text)
    }
    
    // 2a. Test that cipher is successful
    func testOriginalTextIsCiphered(){
        viewController.originalTextField.text="test"
        viewController.textValueChanged(viewController.originalTextField)
        XCTAssertEqual(viewController.cipherTextField.text, SimpleCipherModel.mockCipher)
        
        viewController.originalTextField.text=""
        viewController.textValueChanged(viewController.originalTextField)
        XCTAssertEqual(viewController.cipherTextField.text, "")
    }
 
    
}
