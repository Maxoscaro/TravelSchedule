//
//  StationScheduleService.swift
//  TravelSchedule
//
//  Created by Maksim on 21.02.2025.
//

import Foundation

typealias Schedule = Components.Schemas.ScheduleResponse

protocol StationScheduleServiceProtocol {
    func getScheduleStation(station: String, transportTypes: Operations.getStationSchedule.Input.Query.transport_typesPayload?, date: String) async throws -> Schedule
}

actor StationScheduleService: StationScheduleServiceProtocol, Sendable {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func  getScheduleStation(station: String, transportTypes: Operations.getStationSchedule.Input.Query.transport_typesPayload?, date: String) async throws -> Schedule {
        let response = try await client.getStationSchedule(
            query: .init(
                apikey: apikey,
                station: station,
                date: date,
                transport_types: transportTypes
            )
        )
        return try response.ok.body.json
    }
}
