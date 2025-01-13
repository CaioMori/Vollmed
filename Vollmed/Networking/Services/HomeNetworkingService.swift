//
//  HomeNetworkingService.swift
//  Vollmed
//
//  Created by Caio Mori on 13/01/25.
//

import Foundation

protocol HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError>
}

struct HomeNetworkingService: HTTPClient, HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.getAllSpecialists, responseModel: [Specialist].self)
    }
}
