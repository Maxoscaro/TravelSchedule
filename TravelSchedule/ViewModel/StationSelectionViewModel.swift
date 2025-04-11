//
//  StationSelectionViewModel.swift

//
//  Created by Maksim on 12.03.2025.
//

import SwiftUI

@MainActor

final class StationSelectionViewModel: ObservableObject, Sendable {
    @Published var stations: [Stations] = []
    @Published var searchText: String = ""
    @Published var departureStation: Stations?
    @Published var arrivalStation: Stations?
    @Published var departureCity: City?
    @Published var arrivalCity: City?
    @Published var selectedDeparture: String = ""
    @Published var selectedArrival: String = ""
    
    var onStationSelected: ((String) -> Void)?
    
    var filteredStations: [Stations] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func createDepartureText() {
            if let departureCity = departureCity,
               let departureStation = departureStation {
                self.selectedDeparture = departureCity.name + " (\(departureStation.name))"
            }
        }
        
        func createArrivalText() {
            if let arrivalCity = arrivalCity,
               let arrivalStation = arrivalStation {
                self.selectedArrival = arrivalCity.name + " (\(arrivalStation.name))"
            }
        }
    
    func getStationCodes() -> (from: String, to: String)? {
        guard let fromCode = departureStation?.code,
              let toCode = arrivalStation?.code else { return nil }
        return (fromCode, toCode)
    }
}

