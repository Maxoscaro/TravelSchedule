//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Maksim on 06.02.2025.
//

import SwiftUI
import OpenAPIURLSession

struct MainScreenView: View {
    
    @StateObject private var viewModel = FetchDataController()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
                                await viewModel.demonstrateAllServices()
                            }
        }
    }
}

#Preview {
    MainScreenView()
}
