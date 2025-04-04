//
//  StoriesScreenMainView.swift
//  ScheduleTest
//
//  Created by Maksim on 27.03.2025.
//

import SwiftUI

struct StoriesScreenMainView: View {
    
    let story: StoriesModel
    let initialIndex: Int
    @EnvironmentObject var navigationModel: NavigationViewModel
    @EnvironmentObject var viewModel: StoryScreenViewModel
    
    var body: some View {

        ZStack(alignment: .topTrailing) {
            StoryImageView()
            ProgressBarView(numberOfSections: viewModel.stories.count, progress: viewModel.progress)
                CloseButton()
                Spacer()
                StoryTextContent()
    
        }
        .onAppear {
            viewModel.timer = StoryScreenViewModel.createTimer(configuration: viewModel.configuration)
            viewModel.cancellable = viewModel.timer.connect()
            viewModel.progress = CGFloat(initialIndex) / CGFloat(viewModel.stories.count)
            viewModel.markAsViewed()
            
        }
        .onDisappear {
            viewModel.cancellable?.cancel()
        
        }
        .onReceive(viewModel.timer) { _ in
            viewModel.timerTick()
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onEnded { value in
                    let tapLocation = value.location
                    viewModel.handleTap(location: tapLocation)
                    viewModel.resetTimer()
                }
        )

        .navigationBarBackButtonHidden(true)
    }
    
}


#Preview {
    let viewModel = StoryScreenViewModel()
    return StoriesScreenMainView(story: viewModel.stories[1], initialIndex: 0)
        .environmentObject(viewModel)
        .environmentObject(NavigationViewModel())
}
