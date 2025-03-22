//
//  DirectionsTextFieldView.swift
//  TravelSchedule
//
//  Created by Maksim on 04.03.2025.
//

import SwiftUI

struct DirectionsTextFieldView: View {
    
    @Binding var selectedDeparture: String
    @Binding var selectedArrival: String
    
    @EnvironmentObject var navigationModel: NavigationViewModel
    var onTapFromCity: () -> Void = {}
    var onTapToCity: () -> Void = {}
    
    
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.blueUniversal)
                .frame(height: 128)
            
            HStack {
                VStack(alignment: .leading) {
                    Button(action: {
                        onTapFromCity()
                    }) {
                        HStack {
                            Text(navigationModel.selectedDeparture.isEmpty ? "Откуда" : navigationModel.selectedDeparture)
                                .font(.system(size: 17))
                                .foregroundColor(navigationModel.selectedDeparture.isEmpty ? .gray : .black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                        }
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        onTapToCity()
                    }) {
                        HStack {
                            Text(navigationModel.selectedArrival.isEmpty ? "Куда" : navigationModel.selectedArrival)
                                .font(.system(size: 17))
                                .foregroundColor(navigationModel.selectedArrival.isEmpty ? .gray : .black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                        }
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical, 8)
                .padding(.leading, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                )
                .padding(.trailing, 60)
                .padding(.leading, 16)
                
                Spacer()
            }
            
            Button(action: {
                
                let tempDeparture = navigationModel.selectedDeparture
                navigationModel.selectedDeparture = navigationModel.selectedArrival
                navigationModel.selectedArrival = tempDeparture
            }) {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 36, height: 36)
                    Image("change")
                        .renderingMode(.template)
                }
                .tint(.blueUniversal)
            }
            .padding(.trailing, 16)
            
        }
        .padding(.horizontal)
    }
}
#Preview("С пустыми полями") {
    DirectionsTextFieldView(
        selectedDeparture: .constant(""),
        selectedArrival: .constant("") ,
        
        onTapFromCity: {},
        onTapToCity: {}
    )
    .environmentObject(NavigationViewModel())
}

