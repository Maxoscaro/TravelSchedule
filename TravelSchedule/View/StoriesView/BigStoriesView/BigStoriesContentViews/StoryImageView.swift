//
//  StoryImageView.swift
//  ScheduleTest
//
//  Created by Maksim on 27.03.2025.
//

import SwiftUI

struct StoryImageView: View {
    
    @EnvironmentObject var viewModel: StoryScreenViewModel

    var body: some View {
        Color.black
            .ignoresSafeArea()
        Image(viewModel.currentStory.imageName)
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .clipped()
                 .cornerRadius(40)
                 
         }
    }

#Preview {
    StoryImageView()
        .environmentObject(StoryScreenViewModel())
}
