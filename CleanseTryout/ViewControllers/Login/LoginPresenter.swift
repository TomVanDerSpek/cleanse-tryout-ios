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
    var delegate: LoginDisplayLogic? { get set }
    
    func presentHotelOverview()
    func presentLoginError(response: Login.InvalidUserLogin.Response)
}

final class LoginPresenter {
    weak var delegate: LoginDisplayLogic?
}

// MARK: - LoginPresentationLogic
extension LoginPresenter: LoginPresentationLogic {
    
    func presentHotelOverview() {
        delegate?.displayHotelOverview()
    }
    
    func presentLoginError(response: Login.InvalidUserLogin.Response) {
        let viewModel = Login.InvalidUserLogin.ViewModel(errorMessage: response.invalidLoginReason.errorMessage)
        delegate?.displayLoginError(viewModel: viewModel)
    }
}
