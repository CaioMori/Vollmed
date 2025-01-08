//
//  Patient.swift
//  Vollmed
//
//  Created by Caio Mori on 07/01/25.
//

import Foundation

struct Patient: Identifiable, Codable {
    let id: String?
    let name: String
    let cpf: String
    let email: String
    let phoneNumber: String
    let password: String
    let healthPlan: String

    enum CodingKeys: String, CodingKey {
        case id
        case cpf
        case name = "nome"
        case email
        case password = "senha"
        case phoneNumber = "telefone"
        case healthPlan = "planoSaude"
    }
}
