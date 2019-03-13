//
//  OnboardingRouter.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 13/03/2019.
//

import Foundation
import Cleanse

struct OnboardingRouter: OnboardingViewController.Router {
    let registerViewController: Provider<RegisterViewController>
    let loginViewController: Provider<LoginViewController>
    
    func showRegister(from viewController: UIViewController, with username: String) {
        let registerVC = registerViewController.get()
        registerVC.prefillUsername = username
        viewController.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func showLogin(from viewController: UIViewController) {
        let loginVC = loginViewController.get()
        viewController.navigationController?.setViewControllers([loginVC], animated: true)
    }
}

extension OnboardingRouter: Tag {
    typealias Element = OnboardingViewController.Router
}
