//
//  Watch2View.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/17.
//

import SwiftUI

struct Watch2View: View {
    @Binding var date: Date

    var body: some View {
        let day = Calendar.current.component(.day, from: date)
        let weekday = Calendar.current.component(.weekday, from: date)
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        let second = Calendar.current.component(.second, from: date)
        let miliSecond = Calendar.current.component(.nanosecond, from: date) / 10000000

        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(red: (222 / 255), green: (223 / 255), blue: (218 / 255)).gradient.shadow(.inner(color: .black.opacity(0.6), radius: 1, x: 0, y: 1)))
                .frame(width: 220, height: 100)
            VStack(alignment: .trailing, spacing: 5) {
                HStack {
                    WeekdayView(componentSize: mediumComponentSize, weekday: weekday, shorten: true)
                    DividerView(dividerType: .space, componentSize: CGSize(width: 24, height: 25))
                    DayView(componentSize: mediumComponentSize, month: nil, day: day)
                }
                .padding(.bottom, 5)
                TimeView(componentSize: nil, timeComponentSize: largeComponentSize, secondDividerType: nil, hasMiliSecond: false, hour: hour, minute: minute, second: second, miliSecond: miliSecond)
            }
        }
    }
}

#Preview {
    @State var earlyDate:Date = Date(timeIntervalSince1970: 6000)
    @State var currentDate:Date = Date()
    return VStack {
        Watch2View(date: $earlyDate)
        Watch2View(date: $currentDate)
    }
}
