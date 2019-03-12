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

final class OnboardingViewController: UIViewController {
    typealias Coordinator = RegisterRoute & LoginRoute
    typealias Interactor = OnboardingBusinessLogic & OnboardingDataStore
    
    private var coordinator: Coordinator?
    private var interactor: Interactor
    
    init(interactor: Interactor, coordinator: WeakProvider<Coordinator>) {
        let coordinator = coordinator.get()
        assert(coordinator != nil, "WeakProvider should not return nil!")
        
        self.interactor = interactor
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        interactor.presenter.delegate = self
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
        coordinator?.routeLogin()
    }
    
    func displayRegisterScreen() {
        coordinator?.routeRegister()
    }
}
