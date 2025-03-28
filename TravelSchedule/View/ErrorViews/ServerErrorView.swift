//
//  ServerErrorView.swift

//
//  Created by Maksim on 20.03.2025.
//

import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("serverError")
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)
            
            Text("Ошибка сервера")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blackDay)
                .padding(.top, 16)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    ServerErrorView()
}
