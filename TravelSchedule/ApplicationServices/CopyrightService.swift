//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Maksim on 20.02.2025.
//

import Foundation

typealias Copyright = Components.Schemas.Copyright

protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> Copyright
}

actor CopyrightService: CopyrightServiceProtocol, Sendable {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(
            query: .init(
                apikey: apikey
            )
        )
        return try response.ok.body.json
    }
}
