//
//  CarrierScreenView.swift

//
//  Created by Maksim on 20.03.2025.
//

import SwiftUI

struct CarrierScreenView: View {
    let carrier: CarrierLocal
    @EnvironmentObject var navigationModel: NavigationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(carrier.logo)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 104)
            
                .cornerRadius(24)
                .padding(.vertical, 16)
            
            VStack(alignment: .leading) {
                Text(carrier.name)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 16)
                
                if let email = carrier.email {
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.system(size: 17))
                        Text(email)
                            .font(.system(size: 12))
                            .foregroundColor(.blueUniversal)
                    }
                    .padding(.bottom, 16)
                }
                
                if let phone = carrier.phone {
                    VStack(alignment: .leading) {
                        Text("Телефон")
                            .font(.system(size: 17))
                        Text(phone)
                            .font(.system(size: 12))
                            .foregroundColor(.blueUniversal)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        
        .navigationBarTitle("Информация о перевозчике", displayMode: .inline)
        .customBackButtonStyle(dismissAction: {
            navigationModel.back()
        })
    }
}

//#Preview {
//    CarrierScreenView(carrier: mockCarriers[0])
//        .environmentObject(NavigationViewModel())
//}
