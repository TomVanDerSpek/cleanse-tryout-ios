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

final class OnboardingInteractor: OnboardingDataStore {
    private(set) var presenter: OnboardingPresentationLogic
    
    init(presenter: OnboardingPresenter) {
        self.presenter = presenter
    }
}

// MARK: - OnboardingBusinessLogic
extension OnboardingInteractor: OnboardingBusinessLogic {
    func showLogin() {
        presenter.presentLoginScreen()
    }
    
    func showRegister() {
        presenter.presentRegisterScreen()
    }
}
