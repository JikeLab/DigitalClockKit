//
//  Watch2View.swift
//  DigitalClockKit
//
//  Created by Atsushi Jike on 2023/09/17.
//

import SwiftUI

struct Watch2View: View {
    @Binding var date: Date
    let is24Hour: Bool

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
            VStack(alignment: .trailing, spacing: 0) {
                HStack(spacing: 0) {
                    WeekdayView(edition: .digit, componentSize: mediumComponentSize, weekday: weekday)
                    DigitView(type: .space, componentSize: CGSize(width: 24, height: 25))
                    DayView(componentSize: mediumComponentSize, month: nil, day: day)
                }
                .padding(.trailing, 10)
                .padding(.bottom, 10)
                TimeView(componentSize: nil, timeComponentSize: largeComponentSize, hasSecondDivider: false, hasSecond: true, hasMiliSecond: false, hour: hour, minute: minute, second: second, miliSecond: miliSecond, is24Hour: is24Hour)
            }
            .padding(10)
        }
    }
}

#Preview {
    @State var earlyDate:Date = Date(timeIntervalSince1970: 6000)
    @State var currentDate:Date = Date()
    return VStack {
        Spacer()
        Watch2View(date: $earlyDate, is24Hour: true)
        Watch2View(date: $currentDate, is24Hour: false)
        Spacer()
    }
    .frame(width: 240)
}
