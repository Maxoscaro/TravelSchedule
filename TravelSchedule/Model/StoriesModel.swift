//
//  StoriesModel.swift
//  TravelSchedule
//
//  Created by Maksim on 03.03.2025.
//

import SwiftUI

struct StoriesModel: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    var isViewed: Bool
}
