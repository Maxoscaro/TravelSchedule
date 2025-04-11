//
//  StationListService.swift
//  TravelSchedule
//
//  Created by Maksim on 20.02.2025.
//

import Foundation

typealias StationsList = Components.Schemas.StationListResponse

protocol StationsListServiceProtocol {
    func getStationsList() async throws -> StationsList
}

actor StationsListService: StationsListServiceProtocol, Sendable {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getStationsList() async throws -> StationsList {
        let response = try await client.getStationsList(query: .init(apikey: apikey))
        let sequence = try response.ok.body.html
        let data = try await Data(collecting: sequence, upTo: 40 * 1024 * 1024)
        let allStations = try JSONDecoder().decode(StationsList.self, from: data)
        return allStations
    }
}
