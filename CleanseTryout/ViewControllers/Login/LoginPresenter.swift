//
//  LoginPresenter.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 21/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit
import Cleanse

protocol LoginPresentationLogic: AnyObject {
    func presentHotelOverview()
    func presentLoginError(response: Login.InvalidUserLogin.Response)
}

final class LoginPresenter: LoginViewController.Presenter {
    private weak var delegate: LoginDisplayLogic?
    
    init(delegate: LoginDisplayLogic) {
        self.delegate = delegate
    }
}

// MARK: - LoginPresentationLogic
extension LoginPresenter {
    
    func presentHotelOverview() {
        delegate?.displayHotelOverview()
    }
    
    func presentLoginError(response: Login.InvalidUserLogin.Response) {
        let viewModel = Login.InvalidUserLogin.ViewModel(errorMessage: response.invalidLoginReason.errorMessage)
        delegate?.displayLoginError(viewModel: viewModel)
    }
}
