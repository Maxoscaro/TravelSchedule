//
//  SearchRouteService.swift
//  TravelSchedule
//
//  Created by Maksim on 20.02.2025.
//

import Foundation

typealias Search = Components.Schemas.SearchResponse

protocol SearchRoutesServiceProtocol {
    func searchRoutes(from: String, to: String, transportTypes: Operations.searchRoutes.Input.Query.transport_typesPayload?, date: String) async throws -> Search
}

final class SearchRoutesService: SearchRoutesServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func searchRoutes(from startStation: String, to endStation: String, transportTypes: Operations.searchRoutes.Input.Query.transport_typesPayload?, date: String) async throws -> Search {
        let response = try await client.searchRoutes(
            query: .init(
                from: startStation,
                to: endStation,
                date: date,
                transport_types: transportTypes,
                apikey: apikey
            )
        )
        return try response.ok.body.json
    }
}
