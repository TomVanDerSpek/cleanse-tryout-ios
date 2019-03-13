//
//  OnboardingViewController.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 19/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit
import Cleanse

protocol OnboardingViewControllerDelegate: AnyObject {
    func login()
    func register()
}

protocol OnboardingDisplayLogic: AnyObject {
    func displayLoginScreen()
    func displayRegisterScreen()
}

struct OnboardingPresenterFactory {
    func build(with loginDisplayLogic: OnboardingDisplayLogic) -> OnboardingPresenter {
        return OnboardingPresenter(delegate: loginDisplayLogic)
    }
}

final class OnboardingViewController: UIViewController {
    typealias Router = LoginRoute & RegisterRoute
    typealias Interactor = InteractorProtocol & OnboardingBusinessLogic
    typealias Presenter = PresenterProtocol & OnboardingPresentationLogic
    
    private let router: Router
    private let interactor: Interactor
    private var presenter: Presenter!
    
    init(router: TaggedProvider<OnboardingRouter>, interactor: Interactor, presenterFactory: OnboardingPresenterFactory) {
        self.interactor = interactor
        self.router = router.get()
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenterFactory.build(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Actions
private extension OnboardingViewController {
    @IBAction func showLogin() {
        interactor.showLogin()
    }
    
    @IBAction func showRegister() {
        interactor.showRegister()
    }
}

// MARK: - OnboardingDisplayLogic
extension OnboardingViewController: OnboardingDisplayLogic {
    func displayLoginScreen() {
        router.showLogin(from: self)
    }
    
    func displayRegisterScreen() {
        router.showLogin(from: self)
    }
}
