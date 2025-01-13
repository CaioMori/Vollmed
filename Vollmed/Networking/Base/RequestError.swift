//
//  RequestError.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
    case custom(_ error: [String: Any])
    
    var customMessage: String {
        switch self {
        case .decode: return "Erro de decodificação"
        case .invalidURL: return "URL inválida"
        case .noResponse: return "Não há resposta"
        case .unauthorized: return "Usuário não autorizado"
        case .unknown: return "Erro desconhecido"
        case .custom(let error): return error["message"] as? String ?? "Erro desconhecido"
        }
    }
}
