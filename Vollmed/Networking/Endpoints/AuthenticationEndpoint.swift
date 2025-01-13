//
//  AuthenticationEndpoint.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

enum AuthenticationEndpoint {
    case login
    case register
    case logout
}

extension AuthenticationEndpoint: Endpoint {
    var path: String {
        switch self {
        case .login: return "/auth/login"
        case .register: return "/auth/register"
        case .logout: return "/auth/logout"
        }
    }

    var method: RequestMethod {
        switch self {
        case .login, .register, .logout: return .post
        }
    }

    var header: [String : String]? {
        switch self {
        case .logout:
            guard let token = AuthenticationManager.shared.token else {return nil}
            return [
                "Authorization": "Bearer \(token)",
                "Content-type": "application/json"]
        case .login, .register:
            return [
                "Content-type": "application/json"
            ]
        }
    }

    var body: [String : String]? {
        switch self {
        case .logout:
            return nil
        default:
            return nil
        }
    }

    
}
