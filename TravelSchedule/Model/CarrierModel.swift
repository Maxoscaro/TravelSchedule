
//
//  Created by Maksim on 13.03.2025.
//

import SwiftUI

struct CarrierLocal: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let logoSvg: String
    let logo: String
    let email: String?
    let phone: String?
}
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

