//
//  FilterScreenView.swift

//
//  Created by Maksim on 20.03.2025.
//

import SwiftUI

struct FilterScreenView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var navigationModel: NavigationViewModel
    @EnvironmentObject var filterViewModel: FilterViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(filterViewModel.timePeriods, id: \.self) { period in
                    CheckBoxRow(title: period, isSelected:  filterViewModel.selectedTimes.contains(period)) {
                        filterViewModel.toggleTimeSelection(for: period)
                    }
                }
            }
            
            Text("Показывать варианты с пересадками")
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 20) {
                RadioButtonRow(title: "Да", isSelected: filterViewModel.showTransfers == true) {
                    filterViewModel.setShowTransfers(value: true)
                }
                
                RadioButtonRow(title: "Нет", isSelected:  filterViewModel.showTransfers == false) {
                    filterViewModel.setShowTransfers(value: false)
                }
            }
            
            Spacer()
            
            if filterViewModel.isFilterSelected {
                Button(action: {
                    filterViewModel.applyFilters()
                    dismiss()
                }) {
                    Text("Применить")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blueUniversal)
                        .cornerRadius(16)
                }
                .padding(.bottom, 30)
                .transition(.opacity.animation(.easeInOut(duration: 0.2)))
            }
        }
        .padding(.horizontal, 20)
        .navigationBarStyle(dismissAction: {
            navigationModel.back()
        })
    }
}
  

struct FilterScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FilterScreenView()
                .environmentObject(FilterViewModel())
                .environmentObject(NavigationViewModel())
        }
    }
}
