//
//  CityStationService.swift
//  TravelSchedule
//
//  Created by Maksim on 04.04.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

actor CityStationService: Sendable {
    
    func stationsList() async throws -> [City] {
        guard let serverURL = try? Servers.Server1.url() else {
            return []
        }

        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )

        let service = StationsListService(
            client: client,
            apikey: Constants.apikey
        )

        let response = try await service.getStationsList()

        let russianRegions = response.countries?
            .first(where: { $0.title == "Россия" })?
            .regions ?? []

        var cities: [City] = []

        for region in russianRegions {
            let cityName = region.settlements ?? []
            
            for settlement in cityName {
                guard let title = settlement.title,
                      let stations = settlement.stations else { continue }

                let filteredStations: [Stations] = stations.compactMap { station in
                    guard
                        station.transport_type == "train",
                        let code = station.codes?.yandex_code,
                        let title = station.title,
                        !title.isEmpty
                    else {
                        return nil
                    }
                    return Stations(name: title, code: code)
                }

                if !filteredStations.isEmpty {
                    cities.append(City(name: title, stations: filteredStations.sorted(by: { $0.name < $1.name })))
                }
            }
        }

        return cities
    }
}
