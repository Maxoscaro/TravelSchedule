//
//  ScheduleModel.swift

//
//  Created by Maksim on 18.03.2025.
//
import Foundation

struct ScheduleLocal: Hashable, Identifiable, Sendable {
    let id = UUID()
    let date: String
    let departureTime: String
    let arrivalTime: String
    let durationTime: String
    let transferPoint: String?
    let carrier: CarrierLocal
}
let mockSchedule: [ScheduleLocal] = [
    ScheduleLocal(
        date: "14 января",
        departureTime: "22:30",
        arrivalTime: "08:15",
        durationTime: "20 часов",
        transferPoint: "Костроме",
        carrier: mockCarriers[0]
    ),
    ScheduleLocal(
        date: "15 января",
        departureTime: "01:15",
        arrivalTime: "09:00",
        durationTime: "9 часов",
        transferPoint: nil,
        carrier: mockCarriers[1]
    )
]

