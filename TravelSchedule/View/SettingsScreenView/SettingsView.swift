//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Maksim on 04.03.2025.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var themeService: ThemeService
    
    var body: some View {
        ZStack {
            VStack {
                Toggle(isOn: $themeService.isDarkMode) {
                    Text("Темная тема")
                }
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .padding()
                
                NavigationLink(destination: UserAgreementView())
                {
                    HStack {
                        Text("Пользовательское соглашение")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .accentColor(.blue)
                    }
                    
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    Text("Приложение использует API «Яндекс.Расписания»")
                        .padding()
                    Text("Версия 1.0 (beta)")
                }
                .font(.system(size: 12))
            }
            .padding(.vertical, 24)
            .foregroundColor(.blackDay)
            .font(.system(size: 17))
            
        }

    }
}

#Preview {
    SettingsView()
        .environmentObject(ThemeService())
}
