//
//  AppModule.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 12/03/2019.
//

import Foundation
import Cleanse

extension Modules {
    struct App: Cleanse.Module {
        static func configure(binder: AppBinder) {
            
            binder.bind().to { UIApplication.shared.delegate as! AppDelegate }
            binder.bind().to { UIScreen.main }
            binder.bind().to { UIApplication.shared }

            binder.bind(UIWindow.self).to { (rootViewController: TaggedProvider<RootViewController.Root>, mainScreen: UIScreen) in
                let window = UIWindow(frame: mainScreen.bounds)
                window.rootViewController = rootViewController.get()
                return window
            }

            binder.bind().tagged(with: RootViewController.Root.self).sharedInScope().to(factory: RootViewController.init)
            binder.bind().sharedInScope().to(factory: ApplicationCoordinator.init)

            binder.bind().to(factory: LoginViewController.init)
            binder.bind(LoginViewController.Interactor.self).to(factory: LoginInteractor.init)
            binder.bind().to(factory: LoginPresenter.init)
            binder.bind(LoginViewController.Coordinator.self).sharedInScope().to(factory: ApplicationCoordinator.init)

            binder.bind().to(factory: OnboardingViewController.init)
            binder.bind(OnboardingViewController.Interactor.self).to(factory: OnboardingInteractor.init)
            binder.bind().to(factory: OnboardingPresenter.init)
            binder.bind (OnboardingViewController.Coordinator.self).sharedInScope().to(factory: ApplicationCoordinator.init)
            
            binder.bind().to(factory: RegisterViewController.init)
        }
    }
    
    
}
