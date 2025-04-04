//
//  StoryTextContent.swift
//  ScheduleTest
//
//  Created by Maksim on 27.03.2025.
//

import SwiftUI

struct StoryTextContent: View {
    
    @EnvironmentObject var viewModel: StoryScreenViewModel
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text(viewModel.currentStory.title)
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .lineLimit(2)
                    
                    Text(viewModel.currentStory.description)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .lineLimit(3)
                        .foregroundStyle(.white)
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 50)
        }
    }
}


#Preview {
    StoryTextContent()
        .environmentObject(StoryScreenViewModel())
}
