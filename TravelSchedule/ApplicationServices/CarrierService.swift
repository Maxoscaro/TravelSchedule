//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Maksim on 20.02.2025.
//

import Foundation

import OpenAPIRuntime
import OpenAPIURLSession

typealias Carrier = Components.Schemas.CarrierInfo

protocol CarrierServiceProtocol {
    func getCarrier(code: String) async throws -> Carrier
}

actor CarrierService: CarrierServiceProtocol, Sendable {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarrier(code: String) async throws -> Carrier {
        let response = try await client.getCarrierInfo(
            query: .init(
                apikey: apikey,
                code: code
            )
        )
        return try response.ok.body.json
    }
}
