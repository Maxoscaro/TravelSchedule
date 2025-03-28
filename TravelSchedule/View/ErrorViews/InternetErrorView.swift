//
//  InternetErrorView.swift

//
//  Created by Maksim on 20.03.2025.
//

import SwiftUI

struct InternetErrorView: View {
    var body: some View {
        VStack {
                  Spacer()
                  
                  Image("internetError")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 223, height: 223)
                      
                  Text("Нет интернета")
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
    InternetErrorView()
}
