//
//  ThemeService.swift

//
//  Created by Maksim on 20.03.2025.
//

import SwiftUI
@MainActor
final class ThemeService: ObservableObject, Sendable {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false {
        didSet {
            applyTheme()
        }
    }
    
    init() {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        applyTheme()
    }
    
    private func applyTheme() {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
            }
        }
    }
}
