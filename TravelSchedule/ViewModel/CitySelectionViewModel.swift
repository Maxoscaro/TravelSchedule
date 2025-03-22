//
//  CitySelectionViewModel.swift
//
//  Created by Maksim on 06.03.2025.
//

import SwiftUI

final class CitySelectionViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var searchText: String = ""

    init(selectedCity: City? = nil) {
            self.cities = mockCities
        }
    
    let mockCities: [City] = [
        City(name: "Москва", stations: [
            Stations(name: "Киевский вокзал"),
            Stations(name: "Курский вокзал"),
            Stations(name: "Белорусский вокзал")
        ]),
        City(name: "Санкт-Петербург", stations: [
            Stations(name: "Московский вокзал"),
            Stations(name: "Финляндский вокзал"),
            Stations(name: "Балтийский вокзал")
        ]),
        City(name: "Казань", stations: [
            Stations(name: "Восстания"),
            Stations(name: "Казань-Пасс."),
            Stations(name: "Казань-2")
        ]),
        City(name: "Новосибирск", stations: [
            Stations(name: "Новосибирск-Главный"),
            Stations(name: "Новосибирск-Западный")
        ]),
        City(name: "Сочи", stations: [
            Stations(name: "Адлер"),
            Stations(name: "Хоста"),
            Stations(name: "Сочи")
        ])
    ]

    var filteredCities: [City] {
        if searchText.isEmpty {
            return cities
        } else {
            return cities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
  
    }

