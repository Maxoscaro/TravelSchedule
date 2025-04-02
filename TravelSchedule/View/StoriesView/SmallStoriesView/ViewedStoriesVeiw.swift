//
//  ViewedStoriesVew.swift
//  ScheduleTest
//
//  Created by Maksim on 26.03.2025.
//

import SwiftUI

struct ViewedStoriesView: View {
    let story: StoriesModel
  
    var body: some View {
        ZStack(alignment: .bottomLeading)
        {
            Image(story.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 92, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .saturation(story.isViewed ? 0.5 : 1)
            
                    Text(story.title)
                        .foregroundColor(.white)
                        .font(.footnote)
                        .padding(8)
                        .lineLimit(3)
        }
        .frame(width: 92, height: 140)
        .opacity(0.5)
    }
}

#Preview {
    ViewedStoriesView(story: StoriesModel(imageName: "1", title: "First title", description: "First title", isViewed: true))
}


