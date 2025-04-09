//
//  CitySelectionViewModel.swift
//
//  Created by Maksim on 06.03.2025.
//

import SwiftUI

@MainActor
final class CitySelectionViewModel: ObservableObject, Sendable {
    @Published var cities: [City] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    @Published var showNetworkError: Bool = false
    @Published var showServerError: Bool = false
    
    init() {
        Task {
            await loadCities()
        }
    }
    
    func loadCities() async {
        isLoading = true
        showNetworkError = false
        showServerError = false
        
        do {
            let service = CityStationService()
            let citiesFromNetwork = try await service.stationsList()
            let sorted = citiesFromNetwork.filter { !$0.stations.isEmpty }
            let sortedCity = sorted
                .filter { !$0.name.isEmpty && !$0.stations.isEmpty }
                .sorted { $0.name < $1.name }
            DispatchQueue.main.async {
                self.cities = sortedCity
                self.isLoading = false
            }
        } catch let error as URLError {
            DispatchQueue.main.async {
                self.error = error
                self.isLoading = false
                
                if error.code == .notConnectedToInternet ||
                    error.code == .networkConnectionLost ||
                    error.code == .timedOut {
                    self.showNetworkError = true
                } else {
                    self.showServerError = true
                }
            }
        } catch {
            print("Неизвестная ошибка: \(error)")
            DispatchQueue.main.async {
                self.error = error
                self.isLoading = false
                self.showServerError = true
            }
        }
    }
    
    var filteredCities: [City] {
        if searchText.isEmpty {
            return cities
        } else {
            return cities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
