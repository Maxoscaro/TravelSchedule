//
//  Config.swift
//  Stories-Demo
//
//  Created by Maksim on 26.03.2025.
//

import SwiftUI

struct ConfigurationStory {
    let timerTickInternal: TimeInterval
    let progressPerTick: CGFloat

           init(
               storiesCount: Int,
               secondsPerStory: TimeInterval = 5,
               timerTickInternal: TimeInterval = 0.15
           ) {
               self.timerTickInternal = timerTickInternal
               self.progressPerTick = 1.0 / CGFloat(storiesCount) / secondsPerStory * timerTickInternal
    }
}


