//
//  Watch1View.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/12.
//

import SwiftUI

struct Watch1View: View {
    @Binding var date: Date

    var body: some View {
        let year = Calendar.current.component(.year, from: date)
        let month = Calendar.current.component(.month, from: date)
        let day = Calendar.current.component(.day, from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        let second = Calendar.current.component(.second, from: date)
        let miliSecond = Calendar.current.component(.nanosecond, from: date) / 10000000

        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(red: (194 / 255), green: (216 / 255), blue: (214 / 255)).gradient.shadow(.inner(color: .black.opacity(0.6), radius: 3, x: 0, y: 2)))
                        .frame(width: 220, height: 124)
            VStack(spacing: 0) {
                HStack {
                    WeekdayView(componentSize: matrixComponentSize, weekday: weekday)
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
                        TimeView(componentSize: nil, hasMiliSecond: false, hour: hour, minute: minute, second: second, miliSecond: miliSecond)
                            .padding(.bottom, 5)
                        HStack {
                            AgeView(componentSize: smallComponentSize, year: year)
                            Spacer()
                            DayView(componentSize: smallComponentSize, month: month, day: day)
                        }
                    }
                }
                .padding(10)
            }
            .frame(width: 220)
        }
    }
}

#Preview {
    @State var currentDate:Date = Date()
    return Watch1View(date: $currentDate)
}
