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
        date: "21 марта",
        departureTime: "07:30",
        arrivalTime: "12:15",
        durationTime: "4 часа 45 мин",
        transferPoint: "Костроме",
        carrier: mockCarriers[0]
    ),
    ScheduleLocal(
        date: "21 марта",
        departureTime: "10:45",
        arrivalTime: "15:30",
        durationTime: "4 часа 45 мин",
        transferPoint: nil,
        carrier: mockCarriers[1]
    ),
    ScheduleLocal(
        date: "22 марта",
        departureTime: "13:30",
        arrivalTime: "18:45",
        durationTime: "5 часов 15 мин",
        transferPoint: nil,
        carrier: mockCarriers[2]
    ),
    ScheduleLocal(
        date: "22 марта",
        departureTime: "19:15",
        arrivalTime: "23:40",
        durationTime: "4 часа 25 мин",
        transferPoint: "Костроме",
        carrier: mockCarriers[3]
    ),
    ScheduleLocal(
        date: "23 марта",
        departureTime: "05:00",
        arrivalTime: "10:30",
        durationTime: "5 часов 30 мин",
        transferPoint: nil,
        carrier: mockCarriers[4]
    ),
]


