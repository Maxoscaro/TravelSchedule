//
//  TravelSheduleService.swift
//  TravelSchedule
//
//  Created by Maksim on 21.02.2025.
//

import Foundation
import OpenAPIURLSession

actor TravelScheduleService: Sendable {
    
    static let shared = TravelScheduleService()
    
    private let nearestStationsService: NearestStationsServiceProtocol
    private let nearestSettlementService: NearestSettlementServiceProtocol
    private let carrierService: CarrierServiceProtocol
    private let copyrightService: CopyrightServiceProtocol
    private let stationsListService: StationsListServiceProtocol
    private let treadStationsService: ThreadStationsServiceProtocol
    private let searchRoutesService: SearchRoutesServiceProtocol
    private let stationScheduleService: StationScheduleServiceProtocol
    
    init(client: Client, apikey: String) {
        self.nearestStationsService = NearestStationsService(client: client, apikey: apikey)
        self.nearestSettlementService = NearestSettlementService(client: client, apikey: apikey)
        self.carrierService = CarrierService(client: client, apikey: apikey)
        self.copyrightService = CopyrightService(client: client, apikey: apikey)
        self.stationsListService = StationsListService(client: client, apikey: apikey)
        self.treadStationsService = TreadStationsService(client: client, apikey: apikey)
        self.searchRoutesService = SearchRoutesService(client: client, apikey: apikey)
        self.stationScheduleService = StationScheduleService(client: client, apikey: apikey)
    }
    
     init() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let apikey = Constants.apikey
        self.init(client: client, apikey: apikey)
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        return try await nearestStationsService.getNearestStations(lat: lat, lng: lng, distance: distance)
    }
    
    func getNearestSettlement(lat: Double, lng: Double, distance: Int) async throws -> NearestSettlement {
        return try await nearestSettlementService.getNearestSettlement(lat: lat, lng: lng, distance: distance)
    }
    
    func getCarrier(code: String) async throws -> Carrier {
        return try await carrierService.getCarrier(code: code)
    }
    
    func getCopyright() async throws -> Copyright {
        return try await copyrightService.getCopyright()
    }
    
    func getStationsList() async throws -> StationsList {
        return try await stationsListService.getStationsList()
    }
    
    func getThreadStation(uid: String) async throws -> Thread {
        return try await treadStationsService.getThreadInfo(uid: uid)
    }
    
    func searchRoutesService(from startStation: String, to endStation: String, transportTypes: Operations.searchRoutes.Input.Query.transport_typesPayload?, date: String) async throws -> Search {
        return try await searchRoutesService.searchRoutes(from: startStation, to: endStation)
    }
    
    func getScheduleStation(station: String, transportTypes: Operations.getStationSchedule.Input.Query.transport_typesPayload?, date: String) async throws -> Schedule {
        return try await stationScheduleService.getScheduleStation(station: station, transportTypes: transportTypes, date: date)
    }
}
