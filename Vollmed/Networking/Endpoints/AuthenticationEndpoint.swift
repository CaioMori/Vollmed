//
//  AuthenticationEndpoint.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

enum AuthenticationEndpoint {
    case login(email: String, password: String)
    case logout
}

extension AuthenticationEndpoint: Endpoint {
    var path: String {
        switch self {
        case .logout:
            return "/auth/logout"
        case .login:
            return "/auth/login"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .logout:
            return .post
        case .login:
            return .post
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .logout:
            guard let token = AuthenticationManager.shared.token else {
                return nil
            }
            
            return [
                "Authorization": "Bearer \(token)",
                "Content-Type": "application/json"
            ]
            
        case .login:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .login(let email, let password):
            return [
                "email": email,
                "senha": password
            ]
        case .logout:
            return nil
        }
    }
}
