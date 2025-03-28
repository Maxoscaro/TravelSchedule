//
//  CheckBoxRow.swift

//
//  Created by Maksim on 21.03.2025.
//

import SwiftUI

struct CheckBoxRowView: View {
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
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(Color.blackDay, lineWidth: 2)
                        .frame(width: 24, height: 24)
                    
                    
                    if isSelected {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.blackDay)
                            .frame(width: 24, height: 24)
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.whiteDay)
                        
                        
                    }
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}


