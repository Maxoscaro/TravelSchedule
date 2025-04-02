//
//  SplashSce.swift
//  TravelSchedule
//
//  Created by Maksim on 03.03.2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 1.0
        
        var body: some View {
            ZStack {
                if isActive {
                    ContentView()
                } else {
                    Image("splashScreen")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .opacity(opacity)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        self.opacity = 0.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.isActive = true
                    }
                }
            }
        }
    }

#Preview {
    SplashScreenView()
}
