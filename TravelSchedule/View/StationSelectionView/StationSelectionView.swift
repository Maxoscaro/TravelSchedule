//
//  StationSelectionView.swift

//
//  Created by Maksim on 11.03.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @EnvironmentObject var viewModel: StationSelectionViewModel
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
               
                if isDeparture {
                    viewModel.departureStation = station
                    viewModel.departureCity = city
                    viewModel.createDepartureText()
                } else {
                    viewModel.arrivalStation = station
                    viewModel.arrivalCity = city
                    viewModel.createArrivalText()
                }
                navigationModel.backToRoot()
            }
            
            .listRowSeparator(.hidden)
            
        }
        
        .navigationTitle("Выбор станции")
        .customBackButtonStyle(dismissAction: {
            navigationModel.back()
        })
        .onAppear {
            viewModel.stations = city.stations
        }
    }
}


