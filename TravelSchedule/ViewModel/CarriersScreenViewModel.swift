//
//  CarriersScreenViewModel.swift

//
//  Created by Maksim on 18.03.2025.
//

import SwiftUI

final class CarriersScreenViewModel: ObservableObject {
    
    let mockCarriers: [CarrierLocal] = [
        CarrierLocal(
            name: "РЖД",
            logoSvg: "RJD",
            logo: "RJDfull",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        ),
        CarrierLocal(
            name: "ФГК",
            logoSvg: "FGK",
            logo: "FGK",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        ),
        CarrierLocal(
            name: "Урал логистика",
            logoSvg: "Ural",
            logo: "Ural",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        ),
        CarrierLocal(
            name: "ФГК",
            logoSvg: "FGK",
            logo: "FGK",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        ),
        CarrierLocal(
            name: "Урал логистика",
            logoSvg: "Ural",
            logo: "Ural",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        )
    ]

}


