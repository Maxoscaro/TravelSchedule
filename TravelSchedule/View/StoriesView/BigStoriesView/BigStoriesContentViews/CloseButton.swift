//
//  CloseButton.swift
//  ScheduleTest
//
//  Created by Maksim on 26.03.2025.
//

import SwiftUI

struct CloseButton: View {
    @EnvironmentObject var navigationModel: NavigationViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Button("", systemImage: "xmark.circle.fill") {
               navigationModel.back()
            }
            .symbolRenderingMode(.palette)
            .foregroundStyle(.white, .black)
            .font(.system(size: 30))
            .padding(.top, 52)
            .padding(.trailing, 12)
        }
    }
}
