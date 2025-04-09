//
//  SearchRoutesNetworkService.swift
//  TravelSchedule
//
//  Created by Maksim on 09.04.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

struct DateFormatterHelper {
    static let componentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = [.pad]
        return formatter
    }()
}

actor SearchRoutesNetworkService: Sendable {
    func searchRoutes(fromStationCode: String, toStationCode: String) async throws -> [ScheduleLocal] {
        print("ScheduleService: начало поиска маршрутов")
        
        guard let serverURL = try? Servers.Server1.url() else {
            print("ScheduleService: не удалось получить URL сервера")
            return []
        }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let searchService = SearchRoutesService(
            client: client,
            apikey: Constants.apikey
        )
        
        let response = try await searchService.searchRoutes(
            from: fromStationCode,
            to: toStationCode
        )
        
        let schedule = response.segments?.compactMap { segment -> ScheduleLocal? in
            let date = segment.start_date
            let departure = segment.departure
            let arrival = segment.arrival
            let hasTransfers = segment.has_transfers ?? false
            let stops = segment.stops
            let transfersTitle: String? = {
                if hasTransfers, let stops = stops, !stops.isEmpty {
                    return "С пересадкой в \(stops)"
                } else {
                    return nil
                }
            }()
            let duration = segment.duration
            guard let carrier = segment.thread?.carrier else { return nil }
        
            let transferPoint = segment.transfers?.first?.station?.title
            
            return ScheduleLocal(
                date: formatDateTime(date ?? ""),
                departureTime: timeToHour(from: departure),
                arrivalTime: timeToHour(from: arrival),
                durationTime: formatDuration(from: duration.map { Int($0) }),
                transferPoint: transfersTitle,
                carrier: CarrierLocal(
                    name: carrier.title ?? "",
                    logo_svg: carrier.logo_svg ?? "",
                    logo: carrier.logo ?? "",
                    email: carrier.email,
                    phone: carrier.phone)
            )
        }
        print("SearchRoutesNetworkService: успешно получено расписание — \(schedule?.count ?? 0) вариантов")
        return schedule ?? []
    }
    
    private func timeToHour(from: String?) -> String {
          guard let from else { return "" }
          let time = String(from.dropLast(3))
          return time
      }
    
    private func formatDateTime(_ date: Date?) -> String {
        guard let date = date else { return "" }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
        return outputFormatter.string(from: date)
    }
    
    private func formatDateTime(_ dateTimeString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
        
        guard let date = inputFormatter.date(from: dateTimeString) else {
            return dateTimeString
        }
        
        return outputFormatter.string(from: date)
    }

    private func formatDuration(from duration_seconds: Int?) -> String {
        guard let duration = duration_seconds else { return "" }
        let durationDouble = Double(duration)
        guard
            let time = DateFormatterHelper.componentsFormatter.string(from: durationDouble)
        else { return "" }
        return time
    }
}



