//
//  ApplicationCoordinator.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 12/03/2019.
//

import Foundation
import UIKit
import Cleanse

extension ApplicationCoordinator: LoginRoute { }
extension ApplicationCoordinator: RegisterRoute { }
extension ApplicationCoordinator: OnboardingRoute { }

final class ApplicationCoordinator: CoordinatorProtocol {
    var childCoordinator: CoordinatorProtocol?
    var navigationController: UINavigationController
    
    let registerViewControllerProvider: Provider<RegisterViewController>
    let onboardingViewControllerProvider: Provider<OnboardingViewController>
    let loginViewControllerProvider: Provider<LoginViewController>
    
    init(navigationController: TaggedProvider<RootViewController.Root>,
         onboardingViewControllerProvider: Provider<OnboardingViewController>,
         registerViewControllerProvider: Provider<RegisterViewController>,
         loginViewControllerProvider: Provider<LoginViewController>) {
        self.navigationController = navigationController.get()
        self.onboardingViewControllerProvider = onboardingViewControllerProvider
        self.registerViewControllerProvider = registerViewControllerProvider
        self.loginViewControllerProvider = loginViewControllerProvider
    }
    
    func start() {
        routeOnboarding()
    }
    
    func routeOnboarding() {
        let onboardingVC = onboardingViewControllerProvider.get()
        navigationController.pushViewController(onboardingVC, animated: true)
        navigationController.viewControllers = [onboardingVC]
    }
    
    func routeLogin() {
        let loginVC = loginViewControllerProvider.get()
        navigationController.pushViewController(loginVC, animated: true)
        navigationController.viewControllers = [loginVC]
    }
    
    func routeRegister() {
        let loginVC = loginViewControllerProvider.get()
        navigationController.presentedViewController?.dismiss(animated: true, completion: nil)
        navigationController.pushViewController(loginVC, animated: true)
    }
    
}
