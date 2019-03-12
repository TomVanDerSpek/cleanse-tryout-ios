//
//  OnboardingPresenter.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 19/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit

protocol OnboardingPresentationLogic: AnyObject {
    var delegate: OnboardingDisplayLogic? { get set }
    
    func presentLoginScreen()
    func presentRegisterScreen()
}

final class OnboardingPresenter {
    weak var delegate: OnboardingDisplayLogic?
}

// MARK: - OnboardingPresentationLogic
extension OnboardingPresenter: OnboardingPresentationLogic {
    
    func presentLoginScreen() {
        delegate?.displayLoginScreen()
    }
    
    func presentRegisterScreen() {
        delegate?.displayRegisterScreen()
    }
    
}
