//
//  AppDelegate.swift
//  SimpleCipher
//
//  Created by U3 on 2015-09-26.
//  Copyright © 2015 Ten Kettles Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Setup and assign model, viewmodel, and viewcontroller
        let simpleCipherModel=SimpleCipherModel()
        let simpleCipherViewModel=SimpleCipherViewModel(model:simpleCipherModel)
        let simpleCipherViewController=self.window?.rootViewController as! SimpleCipherViewController
        simpleCipherViewController.viewModel=simpleCipherViewModel
        
        return true
    }

}

