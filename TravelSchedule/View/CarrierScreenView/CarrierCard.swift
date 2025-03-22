//
//  CarrierCard.swift

//
//  Created by Maksim on 18.03.2025.
//

import SwiftUI

struct CarrierCard: View {
    
    let schedule: ScheduleLocal
        var body: some View {
            VStack {
                HStack(alignment: schedule.transferPoint != nil ? .top : .center) {
                    Image(schedule.carrier.logoSvg)
                        .resizable()
                        .frame(width: 38, height: 38)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.trailing, 8)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(schedule.carrier.name)
                            .font(.system(size: 17))

                        if let transfer = schedule.transferPoint {
                            Text("С пересадкой в \(transfer)")
                                .font(.system(size: 12))
                                .foregroundColor(.redUni)
                        }
                    }

                    Spacer()

                    Text(schedule.date)
                        .font(.system(size: 12))
                        
                }
                .padding(.bottom)
                .foregroundColor(.black)

                HStack {
                    Text(schedule.departureTime)
                        .font(.system(size: 17))
                        
                    Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.grayUni)
                    Text(schedule.durationTime)
                        .font(.system(size: 12))
                    Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.grayUni)
                    Text(schedule.arrivalTime)
                        .font(.system(size: 17))
                }
                .foregroundStyle(.black)
            }
            .padding()
            .background(.lightGray)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
    }

    #Preview {
        CarrierCard(schedule: mockSchedule[0])
            .padding()
    }
