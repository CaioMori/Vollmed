//
//  MyAppointmentsViewModel.swift
//  Vollmed
//
//  Created by Caio Mori on 15/01/25.
//

import Foundation

struct MyAppointmentsViewModel {
    
    // MARK: - Attributes
    
    let service: AppointmentServiceable
    
    // MARK: - Init
    
    init(service: AppointmentServiceable) {
        self.service = service
    }
    
    // MARK: - Class methods
    
    func getAllAppointmentsFromPatient(patientID: String) async throws -> [Appointment]? {
        let result = await service.getAllAppointmentsFromPatient(patientID: patientID)
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}
