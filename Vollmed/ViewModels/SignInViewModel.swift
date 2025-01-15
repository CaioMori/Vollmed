//
//  SignInViewModel.swift
//  Vollmed
//
//  Created by Caio Mori on 15/01/25.
//

import Foundation

struct SignInViewModel {
    
    // MARK: - Attributes
    
    let service: HomeServiceable
    let authService: AuthenticationServiceable
    var authManager = AuthenticationManager.shared
    
    // MARK: - Init
    
    init(service: HomeServiceable, authService: AuthenticationServiceable) {
        self.service = service
        self.authService = authService
    }
    
    // MARK: - Class methods

    func login(email: String, password: String) async -> LoginResponse? {
        let result = await authService.login(email: email, password: password)
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            print("Erro no login: \(error)")
            return nil
        }
    }
}
