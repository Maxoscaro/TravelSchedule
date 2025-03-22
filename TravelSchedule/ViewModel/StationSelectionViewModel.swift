//
//  StationSelectionViewModel.swift

//
//  Created by Maksim on 12.03.2025.
//

import SwiftUI

final class StationSelectionViewModel: ObservableObject {
    @Published var stations: [Stations] = []
    @Published var searchText: String = ""

    var onStationSelected: ((String) -> Void)?
    
    var filteredStations: [Stations] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
}


