//
//  CitySelectionView.swift

//
//  Created by Maksim on 06.03.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = CitySelectionViewModel()
    @EnvironmentObject var navigationModel: NavigationViewModel

    var isDeparture: Bool
   
    var body: some View {
        VStack {
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
            
            if viewModel.filteredCities.isEmpty && !viewModel.searchText.isEmpty {
                
                Text("Город не найден")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            List(viewModel.filteredCities) { city in
                
                HStack {
                    Text(city.name)
                        .font(.system(size: 17))
                    Spacer()
                    Image(systemName: "chevron.right")
                    
                        .foregroundColor(.blackDay)
                }
                
                .padding(.vertical, 8)
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    if isDeparture {
                                navigationModel.open(.stationsDeparture(city: city))
                            } else {
                                navigationModel.open(.stationsArrival(city: city))
                    }
                }
                
                .listRowSeparator(.hidden)
                
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Выбор города")
        .customBackButtonStyle(dismissAction: {
            navigationModel.back()
        })
    }
}



#Preview {
    
    CitySelectionView(isDeparture: true)
        .environmentObject(CitySelectionViewModel())
        .environmentObject(NavigationViewModel())
}


