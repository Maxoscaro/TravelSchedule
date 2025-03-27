//
//  StationSelectionView.swift

//
//  Created by Maksim on 11.03.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @StateObject var viewModel = StationSelectionViewModel()
    @EnvironmentObject var navigationModel: NavigationViewModel
    
    let city: City
    var isDeparture: Bool
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Введите запрос", text: $viewModel.searchText)
            
            if !viewModel.searchText.isEmpty {
                Button {
                    viewModel.searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                    
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .padding()
        
        if viewModel.filteredStations.isEmpty && !viewModel.searchText.isEmpty {
            
            Text("Станция не найдена")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        List(viewModel.filteredStations) { station in
            
            HStack {
                Text(station.name)
                    .font(.system(size: 17))
                Spacer()
                Image(systemName: "chevron.right")
                
                    .foregroundColor(.blackDay)
            }
            .foregroundColor(.blackDay)
            .padding(.vertical, 8)
            .contentShape(Rectangle())
            .onTapGesture {
                let result = city.name + " (" + station.name + ")"
                if isDeparture {
                    navigationModel.selectedDeparture = result
                } else {
                    navigationModel.selectedArrival = result
                }
                navigationModel.backToRoot()
            }
            
            .listRowSeparator(.hidden)
            
        }
        
        .navigationTitle("Выбор станции")
        .navigationBarStyle(dismissAction: {
            navigationModel.back()
        })
        .onAppear {
            viewModel.stations = city.stations
        }
    }
}


