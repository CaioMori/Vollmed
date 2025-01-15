enum AppointmentEndpoint {
    case scheduleAppointment(specialist: String, patient: String, date: String)
    case getAllAppointmentsFromPatient(patientID: String)
}

extension AppointmentEndpoint: Endpoint {
    var path: String {
        switch self {
        case .scheduleAppointment:
            return "/consulta"
        case .getAllAppointmentsFromPatient(let patientID):
            return "/paciente/\(patientID)/consultas"
        }
    }

    var method: RequestMethod {
        switch self {
        case .scheduleAppointment:
            return .post
        case .getAllAppointmentsFromPatient:
            return .get
        }
    }

    var header: [String : String]? {
        switch self {
        case .scheduleAppointment, .getAllAppointmentsFromPatient:
            guard let token = AuthenticationManager.shared.token else {
                return nil
            }
            
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }

    var body: [String : String]? {
        switch self {
        case .scheduleAppointment(let specialist, let patient, let date):
            return [
                "especialista": specialist,
                "paciente": patient,
                "data": date
            ]
        case .getAllAppointmentsFromPatient:
            return nil
        }
    }
}
