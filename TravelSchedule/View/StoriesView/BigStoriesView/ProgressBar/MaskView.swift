//
//  MaskView.swift
//  TravelSchedule
//
//  Created by Maksim on 01.04.2025.
//

import SwiftUI
struct MaskView: View {
    let numberOfSections: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}
