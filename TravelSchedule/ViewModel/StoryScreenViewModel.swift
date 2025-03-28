//
//  MainScreenViewModel.swift
//  TravelSchedule
//
//  Created by Maksim on 03.03.2025.
//

import SwiftUI

final class StoryScreenViewModel: ObservableObject {
    
    @Published var stories: [StoriesModel] = []
    
    init() {
        
        loadStories()
    }

    private func loadStories() {
        self.stories = [
            StoriesModel(imageName: "1", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "2", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "3", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "4", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "5", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "6", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "7", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "8", title: "Text Text\nText Text\nText Text"),
            StoriesModel(imageName: "9", title: "Text Text\nText Text\nText Text")
        ]
    }
}

