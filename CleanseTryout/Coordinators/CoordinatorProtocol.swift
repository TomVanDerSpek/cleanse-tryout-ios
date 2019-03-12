//
//  CoordinatorProtocol.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 12/03/2019.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinator: CoordinatorProtocol? { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
