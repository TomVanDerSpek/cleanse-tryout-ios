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
class RootViewController : UINavigationController { }

extension RootViewController {
    /// This will represent the rootViewController that is assigned to our main window
    enum Root: Tag {
        typealias Element = RootViewController
    }
}
