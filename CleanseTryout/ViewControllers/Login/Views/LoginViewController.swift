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

struct ColorConverter { }

protocol TestLoginPresetionLogic {
    init(loginDisplayLogic: LoginDisplayLogic, colorConverter: ColorConverter)
}




struct LoginPresenterFactory {
    func build(with loginDisplayLogic: LoginDisplayLogic) -> LoginPresenter {
        return LoginPresenter(delegate: loginDisplayLogic)
    }
}



final class LoginViewController: UIViewController {
    typealias Router = OnboardingRoute & RegisterRoute
    typealias Interactor = InteractorProtocol & LoginBusinessLogic
    typealias Presenter = PresenterProtocol & LoginPresentationLogic
    
    private let router: Router
    private let interactor: Interactor
    private var presenter: Presenter!
    
    @IBOutlet weak private var usernameTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var errorMessageLabel: UILabel!
    
    init(router: TaggedProvider<LoginRouter>, interactor: Interactor, presenterFactory: LoginPresenterFactory) {
        self.interactor = interactor
        self.router = router.get()
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenterFactory.build(with: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.attach(presenter)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        interactor.detachPresenter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - LoginDisplayLogic
extension LoginViewController: LoginDisplayLogic {
    func displayHotelOverview() {
        router.showOnboarding(from: self)
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
