
//
//  Created by Maksim on 19.03.2025.
//

import SwiftUI

struct NavigationBarModel: ViewModifier {
    var dismissAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .listStyle(PlainListStyle())
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: dismissAction) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blackDay)
                            .rotationEffect(.degrees(180))
                    }
                }
            }
    }
}

extension View {
    func navigationBarStyle(dismissAction: @escaping () -> Void) -> some View {
        self.modifier(NavigationBarModel(dismissAction: dismissAction))
    }
}
