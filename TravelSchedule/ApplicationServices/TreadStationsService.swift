//
//  TreadStationsService.swift
//  TravelSchedule
//
//  Created by Maksim on 20.02.2025.
//

import Foundation

typealias Thread = Components.Schemas.ThreadResponse

protocol ThreadStationsServiceProtocol {
    func getThreadInfo(uid: String) async throws -> Thread
}

final class TreadStationsService: ThreadStationsServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getThreadInfo(uid: String) async throws -> Thread {
        let response = try await client.getThreadInfo(
            query: .init(
                apikey: apikey,
                uid: uid,
                format: .json
            )
        )
        
        return try response.ok.body.json
    }
}
