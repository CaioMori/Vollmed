//
//  RequestError.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
    case custom(_ error: [String: Any]?)
    
    var errorDescription: String? {
        switch self {
        case .decode:
            return "Erro de decodificação"
        case .invalidURL:
            return "URL inválida"
        case .noResponse:
            return "Não há resposta do servidor"
        case .unauthorized:
            return "Usuário não autorizado"
        case .unknown:
            return "Ocorreu um erro desconhecido"
        case .custom(let errorData):
            guard let message = (errorData?["message"] as? [String: Any])?["message"] as? String else {
                return "Erro desconhecido"
            }
            return message
        }
    }
}
