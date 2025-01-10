//
//  AuthenticationManager.swift
//  Vollmed
//
//  Created by Caio Mori on 10/01/25.
//

import Foundation

class AuthenticationManager: ObservableObject {
    
    static let shared = AuthenticationManager()
    
    @Published var token: String?
    @Published var patientID: String?
    
    private init(){
        self.token = KeychainHelper.get(for: "app-vollmed-token")
        self.patientID = KeychainHelper.get(for: "app-vollmed-patient-id")
    }
    
    func saveToken(token: String) {
        KeychainHelper.save(value: token, key: "app-vollmed-token")
        self.token = token
    }
    
    func removeToken(){
        KeychainHelper.remove(for: "app-vollmed-token")
        self.token = nil
    }
    
    func savePatientID(id: String) {
        KeychainHelper.save(value: id, key: "app-vollmed-patient-id")
        self.patientID = id
    }
    
    func removePatientID() {
        KeychainHelper.remove(for: "app-vollmed-patient-id")
        self.patientID = nil
    }
}
