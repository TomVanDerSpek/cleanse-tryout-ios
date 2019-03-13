//
//  OnboardingPresenter.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 19/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit

protocol OnboardingPresentationLogic: AnyObject {
    func presentLoginScreen()
    func presentRegisterScreen()
}

final class OnboardingPresenter: OnboardingViewController.Presenter {
    private weak var delegate: OnboardingDisplayLogic?
    
    init(delegate: OnboardingDisplayLogic) {
        self.delegate = delegate
    }
}

// MARK: - OnboardingPresentationLogic
extension OnboardingPresenter {
    
    func presentLoginScreen() {
        delegate?.displayLoginScreen()
    }
    
    func presentRegisterScreen() {
        delegate?.displayRegisterScreen()
    }
    
}
