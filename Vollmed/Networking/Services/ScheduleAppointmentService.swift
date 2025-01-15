//
//  ScheduleAppointmentService.swift
//  Vollmed
//
//  Created by Caio Mori on 15/01/25.
//

import Foundation

protocol AppointmentServiceable {
    func getAllAppointmentsFromPatient(patientID: String) async -> Result<[Appointment]?, RequestError>
    func scheduleAppointment(specialist: String, patient: String, date: String) async -> Result<ScheduleAppointmentResponse?, RequestError>
}

struct AppointmentService: HTTPClient, AppointmentServiceable {
    func getAllAppointmentsFromPatient(patientID: String) async -> Result<[Appointment]?, RequestError> {
        return await sendRequest(
            endpoint: AppointmentEndpoint
                .getAllAppointmentsFromPatient(patientID: patientID),
            responseModel: [Appointment].self
        )
    }

    func scheduleAppointment(specialist: String, patient: String, date: String) async -> Result<ScheduleAppointmentResponse?, RequestError> {
        return await sendRequest(endpoint: AppointmentEndpoint.scheduleAppointment(
            specialist: specialist,
            patient: patient,
            date: date
        ), responseModel: ScheduleAppointmentResponse.self)
    }
}
