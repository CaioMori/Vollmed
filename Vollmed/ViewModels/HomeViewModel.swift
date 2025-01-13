//
//  HomeViewModel.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

struct HomeViewModel {
    
    // MARK: - Attributes
    
    let service = WebService()
    
    let authManager = AuthenticationManager.shared
    
    // MARK: - Class methods
    
    func getSpecialists() async throws -> [Specialist] {
        do {
            if let fetchSpecialists = try await service.getAllSpecialists() {
                return fetchSpecialists
            }
            
            return []
        } catch {
            print("Ocorreu um erro ao buscar especialistas: \(error)")
            throw error
        }
    }
    
    func logout() async throws {
        do {
            let logoutSuccessful = try await service.logoutPatient()
            if logoutSuccessful {
                authManager.removeToken()
                authManager.removePatientID()
            }
        } catch {
            print("Ocorreu um erro no logout: \(error)")
        }
    }
}
