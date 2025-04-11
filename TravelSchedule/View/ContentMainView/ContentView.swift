//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Maksim on 04.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var themeService = ThemeService()
    @StateObject var navigationModel = NavigationViewModel()
    @StateObject private var filterViewModel = FilterViewModel()
    @StateObject private var storyViewModel = StoryScreenViewModel()
    @StateObject private var stationViewModel = StationSelectionViewModel()
    
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
                    .tabItem {
                        Image("schedule")
                            .renderingMode(.template)
                    }
                
                SettingsView()
                    .tabItem {
                        Image("settings")
                            .renderingMode(.template)
                    }
            }
            
            .navigationDestination(for: ScheduleScreens.self) { screen in
                switch screen {
                case .citiesDeparture:
                    CitySelectionView(isDeparture: true)
                    
                case .stationsDeparture(let city):
                    StationSelectionView(city: city,isDeparture: true)
                    
                case .citiesArrival:
                    CitySelectionView(isDeparture: false)
                    
                case .stationsArrival(let city):
                    StationSelectionView(
                        city: city,
                        isDeparture: false)
                    
                case .carrierList:
                    CarriersScreenView()
                    
                case .carrierInfo(let carrier):
                    CarrierScreenView(carrier: carrier)
                    
                case .filterSchedule:
                    FilterScreenView()
                case .storiesScreenMainView(let index):
                    StoriesScreenMainView(story: storyViewModel.stories[index], initialIndex: index)
                }
            }
            .tint(.blackDay)
        }
        .environmentObject(themeService)
        .environmentObject(filterViewModel)
        .environmentObject(navigationModel)
        .environmentObject(storyViewModel)
        .environmentObject(stationViewModel)
    }
}

#Preview {
    ContentView()
    
}
