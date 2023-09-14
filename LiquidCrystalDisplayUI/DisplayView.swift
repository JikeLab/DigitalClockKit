//
//  DisplayView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/12.
//

import SwiftUI

struct DisplayView: View {
    let timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()

    @State var year: Int = 0
    @State var month: Int = 0
    @State var day: Int = 0
    @State var weekday: Int = 0
    @State var hour: Int = 0
    @State var minute: Int = 0
    @State var second: Int = 0
    @State var miliSecond: Int = 0

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    WeekdayView(componentSize: matrixComponentSize, weekday: $weekday)
                        .padding(10)
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 1, height: (matrixComponentSize.height + 10 * 2))
                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: 1)
                HStack {
                    VStack {
                        TimeView(componentSize: nil, hasMiliSecond: false, hour: $hour, minute: $minute, second: $second, miliSecond: $miliSecond)
                            .padding(.bottom, 5)
                        HStack {
                            AgeView(componentSize: smallComponentSize, year: $year)
                            Spacer()
                            DayView(componentSize: smallComponentSize, month: $month, day: $day)
                        }
                    }
                }
                .padding(10)
            }
            .background(Color(red: (194 / 255), green: (216 / 255), blue: (214 / 255)))
            .frame(width: 220)
            .cornerRadius(6)
        }.onReceive(timer){ _ in
            year = Calendar.current.component(.year, from: Date())
            month = Calendar.current.component(.month, from: Date())
            day = Calendar.current.component(.day, from: Date())
            weekday = Calendar.current.component(.weekday, from: Date())
            hour = Calendar.current.component(.hour, from: Date())
            minute = Calendar.current.component(.minute, from: Date())
            second = Calendar.current.component(.second, from: Date())
            miliSecond = Calendar.current.component(.nanosecond, from: Date()) / 10000000
        }
    }
}

#Preview {
    DisplayView()
}
