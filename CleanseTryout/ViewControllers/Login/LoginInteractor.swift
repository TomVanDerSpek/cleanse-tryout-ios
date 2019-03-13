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

final class LoginInteractor: LoginViewController.Interactor {
    private weak var presenter: LoginViewController.Presenter?
    

    func attach(_ presenter: PresenterProtocol) {
        self.presenter = presenter as? LoginViewController.Presenter
    }
    
    func detachPresenter() {
        self.presenter = nil
    }
}

// MARK: - LoginBusinessLogic
extension LoginInteractor {
    func userLogin(request: Login.UserLogin.Request) {
        
        guard let username = request.username, let password = request.password, !username.isEmpty && !password.isEmpty else {
            let response = Login.InvalidUserLogin.Response(invalidLoginReason: .emptyData)
            presenter?.presentLoginError(response: response)
            return
        }
        
        let response = Login.InvalidUserLogin.Response(invalidLoginReason: .invalidCredentials)
        presenter?.presentLoginError(response: response)
    }
}
