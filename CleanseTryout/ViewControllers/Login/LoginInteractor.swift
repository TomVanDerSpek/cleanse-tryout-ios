//
//  LoginInteractor.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 21/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic: AnyObject {
    func userLogin(request: Login.UserLogin.Request)
}

protocol LoginDataStore {
    var presenter: LoginPresentationLogic { get }
}

final class LoginInteractor: LoginDataStore {
    private(set) var presenter: LoginPresentationLogic
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
    }
}

// MARK: - LoginBusinessLogic
extension LoginInteractor: LoginBusinessLogic {
    func userLogin(request: Login.UserLogin.Request) {
        
        guard let username = request.username, let password = request.password, !username.isEmpty && !password.isEmpty else {
            let response = Login.InvalidUserLogin.Response(invalidLoginReason: .emptyData)
            presenter.presentLoginError(response: response)
            return
        }
        
        let response = Login.InvalidUserLogin.Response(invalidLoginReason: .invalidCredentials)
        presenter.presentLoginError(response: response)
    }
}
