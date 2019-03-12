//
//  LoginModels.swift
//  CleansTryout
//
//  Created by Jeroen Zonneveld on 21/02/2019.
//  Copyright © 2019 Triple. All rights reserved.
//

import UIKit

enum Login {
    enum UserLogin {
        struct Request {
            var username: String?
            var password: String?
        }
    }
    
    enum InvalidUserLogin {
        struct Response {
            var invalidLoginReason: InvalidLoginReason
        }
        
        struct ViewModel {
            var errorMessage: String
        }
    }
}

enum InvalidLoginReason {
    case emptyData
    case invalidCredentials
    
    var errorMessage: String {
        switch self {
        case .emptyData:
            return "No username or password set"
        case .invalidCredentials:
            return "Invalid credentials"
        }
    }
}
