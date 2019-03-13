//
//  RootViewController.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 12/03/2019.
//

import Foundation
import UIKit
import Cleanse

/// Root View Controller for our application
class RootViewController : UINavigationController {
    
    init(initialViewController: OnboardingViewController) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [initialViewController]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RootViewController {
    /// This will represent the rootViewController that is assigned to our main window
    enum Root: Tag {
        typealias Element = RootViewController
    }
}
