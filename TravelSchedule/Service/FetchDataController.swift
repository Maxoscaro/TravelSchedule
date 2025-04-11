//
//  MainScreenViewModel.swift
//  TravelSchedule
//
//  Created by Maksim on 21.02.2025.
//

import Foundation
@MainActor
final class FetchDataController: ObservableObject, Sendable {
    
    private let service = TravelScheduleService.shared
    
    
    func demonstrateAllServices() async {
        do {
            _ = try await fetchNearestStations()
            _ = try await fetchNearestSettlements()
            _ = try await fetchCarrierInfo()
            _ = try await fetchCopyrightInfo()
            _ = try await fetchAllStationsList()
            _ = try await fetchThreadInfo()
            _ = try await fetchSearchRoutes()
            _ = try await fetchScheduleStation()
            
        } catch {
            print("Ошибка при выполнении запросов: \(error.localizedDescription)")
            print("Технические детали: \(error)")
        }
    }
    
    func fetchNearestStations() async throws -> NearestStations {
        let result = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
        if let count = result.stations?.count {
            print("✅ Найдено \(count) станций поблизости")
        }
        return result
    }
    
    func fetchNearestSettlements() async throws -> NearestSettlement {
        let result = try await service.getNearestSettlement(lat: 54.106677, lng: 39.601726, distance: 50)
        print("✅ Найдено \(String(describing: result.settlements?.count)) населенных пунктов поблизости")
        return result
    }
    
    func fetchCarrierInfo() async throws -> Carrier {
        let result = try await service.getCarrier(code: "680")
        print("✅ Получена информация о перевозчике: \(result.title ?? "Н/Д")")
        return result
    }
    
    func fetchCopyrightInfo() async throws -> Copyright {
        let result = try await service.getCopyright()
        print("✅ Получена информация об авторских правах")
        return result
    }
    
    func fetchAllStationsList() async throws -> StationsList {
        let result = try await service.getStationsList()
        print("✅ Список станций успешно получен")
        return result
    }
    
    func fetchThreadInfo() async throws -> Thread {
        let result = try await service.getThreadStation(uid: "068S_2_2")
        if let title = result.thread?.title {
            print("✅ Получена информация о нитке: \(title)")
        } else {
            print("✅ Информация о нитке получена")
        }
        return result
    }
    func fetchSearchRoutes() async throws {
        let result = try await service.searchRoutesService(from: "s9600213", to: "c146", transportTypes: .train, date: "2025-04-10")
        print("✅ Найдено маршрутов: \(result.segments?.count ?? 0)")
    }
    
    func fetchScheduleStation() async throws {
        let result = try await service.getScheduleStation(station: "s9600213", transportTypes: 
            .train, date: "2025-03-01")
        print("✅ Получено расписание с \(result.schedule?.count ?? 0) рейсами")
    }
}
