
//
//  Created by Maksim on 13.03.2025.
//

import SwiftUI

struct CarrierLocal: Hashable, Identifiable, Sendable {
    let id = UUID()
    let name: String
    let logo_svg: String
    let logo: String
    let email: String?
    let phone: String?
}

let mockCarriers: [CarrierLocal] = [
    CarrierLocal(
        name: "РЖД",
        logo_svg: "RJD",
        logo: "RJDfull",
        email: "i.lozgkina@yandex.ru",
        phone: "+7 (904) 329-27-71"
    ),
    CarrierLocal(
        name: "ФГК",
         logo_svg: "FGK",
        logo: "FGK",
        email: "i.lozgkina@yandex.ru",
        phone: "+7 (904) 329-27-71"
    )
]
