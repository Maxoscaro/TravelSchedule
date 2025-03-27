//
//  CarriersScreenView.swift

//
//  Created by Maksim on 18.03.2025.
//

import SwiftUI

struct CarriersScreenView: View {
    
    @EnvironmentObject var navigationModel: NavigationViewModel
    @EnvironmentObject var filterViewModel: FilterViewModel

    var body: some View {
        ZStack {
            VStack {
                Text("\(navigationModel.selectedDeparture) → \(navigationModel.selectedArrival)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.blackDay)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if filterViewModel.filteredSchedules.isEmpty {
                                 VStack {
                                     Spacer()
                                     Text("Вариантов нет")
                                         .font(.system(size: 24, weight: .bold))
                                         .foregroundStyle(.blackDay)
                                         .frame(alignment: .center)
                                 }
                                 
                             }
                             ScrollView {
                                 LazyVStack(spacing: 8) {
                                     ForEach(filterViewModel.filteredSchedules) { schedule in
                                         Button(action: {
                                             navigationModel.open(.carrierInfo(carrier: schedule.carrier))
                                         }) {
                                             CarrierCard(schedule: schedule)
                                         }
                                     }
                                 }
                                 .padding(.bottom, 68)
                             }
                             .scrollIndicators(.hidden)
                             
                         }
                         .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 24, bottomTrailing: 24, topTrailing: 0), style: .continuous))
                         
                         VStack {
                             Spacer()
                             
                             Button(action: {
                                 navigationModel.open(.filterSchedule)
                             }) {
                                 HStack {
                                     Text("Уточнить время")
                                         .foregroundColor(.white)
                                         .font(.system(size: 17, weight: .bold))
                                     
                                     if filterViewModel.isFilterSelected {
                                         Circle()
                                             .fill(.redUni)
                                             .frame(width: 8, height: 8)
                                     }
                                 }
                                 .frame(maxWidth: .infinity, maxHeight: 60)
                                 .background(.blueUniversal)
                                 .cornerRadius(16)
                             }
                             .padding(.bottom, 3)
                         }
                     }
                     .padding()
                     .navigationBarStyle(dismissAction: {
                         navigationModel.back()
                     })
                     .onAppear {
                         filterViewModel.applyFilters()
                     }
                 }
             }

 
#Preview {
    CarriersScreenView()
        .environmentObject(NavigationViewModel())
        .environmentObject(FilterViewModel())
}
