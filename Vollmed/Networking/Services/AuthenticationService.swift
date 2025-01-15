//
//  AuthenticationService.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

protocol AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError>
    func login(email: String, password: String) async -> Result<LoginResponse?, RequestError>
}

struct AuthenticationService: HTTPClient, AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError> {
        return await sendRequest(endpoint: AuthenticationEndpoint.logout, responseModel: nil)
    }
    
    func login(email: String, password: String) async -> Result<LoginResponse?, RequestError> {
        return await sendRequest(endpoint: AuthenticationEndpoint.login(email: email, password: password), responseModel: LoginResponse.self)
    }
}
