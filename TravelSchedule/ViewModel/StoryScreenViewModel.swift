//
//  MainScreenViewModel.swift
//  TravelSchedule
//
//  Created by Maksim on 03.03.2025.
//

import SwiftUI
import Combine

@MainActor
final class StoryScreenViewModel: ObservableObject, Sendable {
    
    @Published var stories: [StoriesModel]
    @Published var progress: CGFloat = 0
    @Published var viewedStories: Set<Int> = []
    var cancellable: Cancellable?
    let configuration: ConfigurationStory
    var currentStoryIndex: Int {
        Int(progress * CGFloat(stories.count))
    }
    var currentStory: StoriesModel {
        stories[currentStoryIndex]
    }
    var timer: Timer.TimerPublisher
    
    init(stories: [StoriesModel] = []) {
        let storiesData = stories.isEmpty ? StoryScreenViewModel.mockStories : stories
        self.stories = storiesData
        self.configuration = ConfigurationStory(storiesCount: storiesData.count)
        self.timer = Self.createTimer(configuration: configuration)
        
    }
    
    static let mockStories: [StoriesModel] = [
        StoriesModel(imageName: "1", title: "Text Text Text Text \nText Text Text Text Text Text Text TextText Text Text Text", description: "Text Text Text Text Text Text Text Text \nText TextText Text Text Text Text TextText Text Text Text Text Text Text TextText Text Text Text", isViewed: false),
        StoriesModel(imageName: "2", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false),
        StoriesModel(imageName: "3", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false),
        StoriesModel(imageName: "4", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false),
        StoriesModel(imageName: "5", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false),
        StoriesModel(imageName: "6", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false),
        StoriesModel(imageName: "7", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false),
        StoriesModel(imageName: "8", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false),
        StoriesModel(imageName: "9", title: "Text Text\nText Text\nText Text", description: "Text Text\nText Text\nText Text", isViewed: false)
    ]
    
    func timerTick() {
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
        }
        withAnimation{
            progress = nextProgress
        }
    }
    
    func nextStory() {
        
        let nextIndex = currentStoryIndex + 1
        if nextIndex < stories.count {
            progress = CGFloat(nextIndex) / CGFloat(stories.count)
            stories[currentStoryIndex].isViewed = true
        } else {
            progress = 0
        }
    }
    
    func markAsViewed() {
        if currentStoryIndex < stories.count {
            stories[currentStoryIndex].isViewed = true
            objectWillChange.send()
        }
    }
    
    func resetTimer() {
        cancellable?.cancel()
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    func handleTap(location: CGPoint) {
        let width = UIScreen.main.bounds.width
        if location.x < width / 2 {
            previousStory()
        } else {
            markAsViewed()
            nextStory()
        }
    }
    
    func previousStory() {
        let previousIndex = currentStoryIndex - 1
        if previousIndex >= 0 {
            progress = CGFloat(previousIndex) / CGFloat(stories.count)
        } else {
            progress = 0
        }
    }
    
    static func createTimer(configuration: ConfigurationStory) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}


