//
//  Endpoint.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String] { get }
    var body: [String: String] { get }
}

extension Endpoint {
    var scheme: String { return "https" }
    
    var host: String {
        return "localhost:3000"
    }
}
