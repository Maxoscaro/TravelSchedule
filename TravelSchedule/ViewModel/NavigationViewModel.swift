//
//  NavigationModel.swift

//
//  Created by Maksim on 13.03.2025.
//

import SwiftUI

enum ScheduleScreens: Hashable {
    case citiesDeparture
    case stationsDeparture(city: City)
    
    case citiesArrival
    case stationsArrival(city: City)
    
    case carrierList
    case carrierInfo(carrier: CarrierLocal)
    case filterSchedule
    
}

final class NavigationViewModel: ObservableObject {
    @Published var path: [ScheduleScreens] = []
    @Published var selectedDeparture: String = ""
    @Published var selectedArrival: String = ""
    
    func open(_ screen: ScheduleScreens) {
        path.append(screen)
    }
    
    func back() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func backToRoot() {
        path.removeAll()
    }
}
