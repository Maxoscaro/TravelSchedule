//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Maksim on 03.03.2025.
//

import SwiftUI

struct StoriesView: View {
    
    var story: StoriesModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading)
        {
            Image(story.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 92, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                    Text(story.title)
                        .foregroundColor(.white)
                        .font(.footnote)
                        .padding(8)
        }
        .frame(width: 92, height: 140)
        .overlay(
                   RoundedRectangle(cornerRadius: 16)
                       .stroke(Color.blue, lineWidth: 4)
                   )
        .onTapGesture {
         
        }
    }
}

#Preview {
    StoriesView(story: StoriesModel(imageName: "1", title: "First title"))
}
