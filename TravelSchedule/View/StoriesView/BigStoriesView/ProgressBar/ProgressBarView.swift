//
//  ProgressBarView.swift
//  ScheduleTest
//
//  Created by Maksim on 26.03.2025.
//

import SwiftUI

extension CGFloat {
    static let progressBarCornerRadius: CGFloat = 6
    static let progressBarHeight: CGFloat = 6
}

struct ProgressBarView: View {
    
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
         
           GeometryReader { geometry in
               ZStack(alignment: .leading) {
                   RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                       .frame(width: geometry.size.width, height: .progressBarHeight)
                       .foregroundColor(.white)

                   RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                       .frame(
                         
                           width: min(
                               progress * geometry.size.width,
                               geometry.size.width
                           ),
                           height: .progressBarHeight
                       )
                       .foregroundColor(.blue)
               }
               .mask {
                   MaskView(numberOfSections: numberOfSections)
               }
           }
           .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
       }
    
   }


#Preview {
    Color.green
           .ignoresSafeArea()
           .overlay(
               ProgressBarView(numberOfSections: 5, progress: 0.5)
                   .padding()
           )
   }
