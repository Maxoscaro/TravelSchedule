//
//  NearestSettlementService.swift
//  TravelSchedule
//
//  Created by Maksim on 14.02.2025.
//

import Foundation

typealias NearestSettlement = Components.Schemas.Settlements

protocol NearestSettlementServiceProtocol {
    func getNearestSettlement(lat: Double, lng: Double, distance: Int) async throws -> NearestSettlement
}

actor NearestSettlementService: NearestSettlementServiceProtocol, Sendable {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getNearestSettlement(lat: Double, lng: Double, distance: Int) async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(
            query: .init(
                apikey: apikey,
                lat: lat,
                lng: lng,
                distance: distance
            )
        )
        return try response.ok.body.json
    }
}
