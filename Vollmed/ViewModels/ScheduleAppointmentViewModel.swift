//
//  ScheduleAppointmentViewModel.swift
//  Vollmed
//
//  Created by Caio Mori on 15/01/25.
//

import Foundation

struct ScheduleAppointmentViewModel {
    
    // MARK: - Attributes
    
    let service: AppointmentServiceable
    
    // MARK: - Init
    
    init(service: AppointmentServiceable) {
        self.service = service
    }
    
    // MARK: - Class methods
    
    func scheduleAppointment(specialist: String, patient: String, date: String) async throws -> ScheduleAppointmentResponse? {
        let result = await service.scheduleAppointment(specialist: specialist, patient: patient, date: date)
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}
