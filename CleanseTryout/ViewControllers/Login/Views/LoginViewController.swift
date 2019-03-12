//
//  LoginViewController.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 21/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit
import Cleanse

protocol LoginDisplayLogic: AnyObject {
    func displayHotelOverview()
    func displayLoginError(viewModel: Login.InvalidUserLogin.ViewModel)
}

final class LoginViewController: UIViewController {
    typealias Coordinator = OnboardingRoute
    typealias Interactor = LoginBusinessLogic & LoginDataStore
    
    private var coordinator: Coordinator?
    private var interactor: Interactor
    
    @IBOutlet weak private var usernameTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var errorMessageLabel: UILabel!
    
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

// MARK: - LoginDisplayLogic
extension LoginViewController: LoginDisplayLogic {
    func displayHotelOverview() {
        coordinator?.routeOnboarding()
    }
    
    func displayLoginError(viewModel: Login.InvalidUserLogin.ViewModel) {
        errorMessageLabel.text = viewModel.errorMessage
    }
}

// MARK: - Actions
private extension LoginViewController {
    @IBAction func login() {
        let request = Login.UserLogin.Request(username: usernameTextField.text, password: passwordTextField.text)
        interactor.userLogin(request: request)
    }
}
