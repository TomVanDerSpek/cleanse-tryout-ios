//
//  OnboardingInteractor.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 19/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit

protocol OnboardingBusinessLogic: AnyObject {
    func showLogin()
    func showRegister()
}

protocol OnboardingDataStore {
    var presenter: OnboardingPresentationLogic { get }
}

final class OnboardingInteractor: OnboardingViewController.Interactor {
    private weak var presenter: OnboardingViewController.Presenter?
    
    func attach(_ presenter: PresenterProtocol) {
        self.presenter = presenter as? OnboardingViewController.Presenter
    }
    
    func detachPresenter() {
        self.presenter = nil
    }
}

// MARK: - OnboardingBusinessLogic
extension OnboardingInteractor {
    func showLogin() {
        presenter?.presentLoginScreen()
    }
    
    func showRegister() {
        presenter?.presentRegisterScreen()
    }
}
