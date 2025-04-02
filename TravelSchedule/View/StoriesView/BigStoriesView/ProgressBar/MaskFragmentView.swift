//
//  MaskFragmentView.swift
//  ScheduleTest
//
//  Created by Maksim on 26.03.2025.
//

import SwiftUI

struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fixedSize(horizontal: false, vertical: true)
                        .frame(height: 6)
                        .foregroundStyle(.blue)
    }
}

#Preview {
    MaskFragmentView()
}
