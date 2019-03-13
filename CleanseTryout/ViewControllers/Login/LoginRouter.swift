//
//  LoginRouter.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 13/03/2019.
//

import Foundation
import Cleanse

struct LoginRouter: LoginViewController.Router {
        
    let registerViewController: Provider<RegisterViewController>
    let onboardingViewController: Provider<OnboardingViewController>
    
    func showRegister(from viewController: UIViewController, with username: String) {
        let registerVC = registerViewController.get()
        registerVC.prefillUsername = username
        viewController.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func showOnboarding(from viewController: UIViewController) {
        let onboardingVC = onboardingViewController.get()
        viewController.navigationController?.setViewControllers([onboardingVC], animated: true)
    }
    
}

extension LoginRouter: Tag {
    typealias Element = LoginViewController.Router
}
