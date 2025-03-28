//
//  RadioBoxRow.swift

//
//  Created by Maksim on 21.03.2025.
//

import SwiftUI

struct RadioButtonRowView: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 17))
                    .foregroundColor(.blackDay)
                
                Spacer()
            
                ZStack {
                    Circle()
                        .strokeBorder(Color.blackDay, lineWidth: 2)
                        .frame(width: 24, height: 24)
                    
                    if isSelected {
                        Circle()
                            .fill(Color.blackDay)
                            .frame(width: 12, height: 12)
                    }
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}
