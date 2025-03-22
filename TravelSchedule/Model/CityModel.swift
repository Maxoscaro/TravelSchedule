//
//  CityModel.swift

//
//  Created by Maksim on 06.03.2025.
//

import SwiftUI

struct City:  Identifiable, Hashable {
    let id = UUID()
    let name: String
    let stations: [Stations]
}



