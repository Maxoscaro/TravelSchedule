//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Maksim on 04.03.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationModel = NavigationViewModel()
    @StateObject var citySelectionViewModel = CitySelectionViewModel()
    @StateObject var stationSelectionViewModel = StationSelectionViewModel()
    @StateObject private var filterViewModel = FilterViewModel()
    @StateObject private var themeService = ThemeService()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.whiteDay
        appearance.shadowColor = UIColor.grayDay
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        NavigationStack(path: $navigationModel.path) {
            TabView {
                MainScreenView()
                    .navigationDestination(for: ScheduleScreens.self) { screen in
                        switch screen {
                        case .citiesDeparture:
                            CitySelectionView(isDeparture: true)
                                .environmentObject(navigationModel)
                                .environmentObject(citySelectionViewModel)
                        case .stationsDeparture(let city):
                            StationSelectionView(city: city,
                                                 isDeparture: true)
                            
                            .environmentObject(navigationModel)
                            .environmentObject(stationSelectionViewModel)
                        case .citiesArrival:
                            CitySelectionView(isDeparture: false)
                                .environmentObject(navigationModel)
                                .environmentObject(citySelectionViewModel)
                        case .stationsArrival(let city):
                            StationSelectionView(
                                city: city,
                                isDeparture: false)
                            .environmentObject(navigationModel)
                            .environmentObject(stationSelectionViewModel)
                            
                        case .carrierList:
                            CarriersScreenView()
                                .environmentObject(navigationModel)
                                .environmentObject(filterViewModel)
                        case .carrierInfo(let carrier):
                            CarrierScreenView(carrier: carrier)
                                .environmentObject(navigationModel)
                        case .filterSchedule:
                            FilterScreenView()
                                .environmentObject(navigationModel)
                                .environmentObject(filterViewModel)
                                .environmentObject(themeService)
                        }
                    }
                    .environmentObject(navigationModel)
                    .environmentObject(citySelectionViewModel)
                    .environmentObject(stationSelectionViewModel)
                    .environmentObject(filterViewModel)
                    .environmentObject(themeService)
                
                    .tabItem {
                        Image("schedule")
                            .renderingMode(.template)
                    }
                
                SettingsView()
                    .tabItem {
                        Image("settings")
                            .renderingMode(.template)
                    }
                    .environmentObject(themeService)
            }
            .tint(.blackDay)
        }
    }
}

#Preview {
    ContentView()
    
}
