//
//  Watch1View.swift
//  DigitalClockKit
//
//  Created by Atsushi Jike on 2023/09/12.
//

import SwiftUI

let baseDate = Date()

struct Watch1View: View {
    @Binding var date: Date
    let mode: Mode
    let dualTimeInterval: TimeInterval = -32400

    var body: some View {
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        let second = Calendar.current.component(.second, from: date)
        let miliSecond = Calendar.current.component(.nanosecond, from: date) / 10000000

        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(red: (194 / 255), green: (216 / 255), blue: (214 / 255)).gradient.shadow(.inner(color: .black.opacity(0.6), radius: 3, x: 0, y: 2)))
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    switch mode {
                    case .clock:
                        let weekday = Calendar.current.component(.weekday, from: date)

                        WeekdayView(edition: .matrix, componentSize: matrixComponentSize, weekday: weekday)
                            .padding(.trailing, 10)

                    default:
                        HStack {
                            MatrixView(coordinates: mode.iconCoordinates, maxMatrix: nil, componentSize: CGSize(width:18, height: 18), color: Color.black, margin: 0)
                            ForEach(mode.labelCoordinateGrid, id: \.self) { coordinates in
                                MatrixView(coordinates: coordinates, maxMatrix: nil, componentSize: CGSize(width: (36 / mode.labelCoordinateGrid.count), height: 18), color: Color.black, margin: 0)
                            }
                        }
                        .padding(.trailing, 10)
                    }
                    Rectangle()
                        .frame(width: 1, height: (matrixComponentSize.height + 10 * 2))
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                        Spacer()
                    }
                    .frame(width: 100, height: (matrixComponentSize.height + 10 * 2))
                }
                Rectangle()
                    .frame(height: 1)
                VStack {
                    switch mode {
                    case .clock:
                        let year = Calendar.current.component(.year, from: date)
                        let month = Calendar.current.component(.month, from: date)
                        let day = Calendar.current.component(.day, from: date)

                        TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: false, hasSecond: true, hasMiliSecond: false, hour: hour, minute: minute, second: second, miliSecond: miliSecond)
                        Spacer()
                        HStack(spacing: 0) {
                            AgeView(componentSize: smallComponentSize, year: year)
                            Spacer()
                            DayView(componentSize: smallComponentSize, month: month, day: day)
                        }

                    case .dataBank:
                        VStack {
                            DigitContainerView(value: "012-3456-7890", componentSize: mediumComponentSize, spacing: 0.4)
                            Spacer()
                        }

                    case .calculator:
                        let dualYear = Calendar.current.component(.year, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualMonth = Calendar.current.component(.month, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualDay = Calendar.current.component(.day, from: Date(timeInterval: dualTimeInterval, since: date))
                        VStack() {
                            HStack(spacing: 0) {
                                Spacer()
                                DigitContainerView(value: "123.45", componentSize: defaultComponentSize, spacing: 1)
                            }
                            Spacer()
                            HStack(spacing: 0) {
                                AgeView(componentSize: smallComponentSize, year: dualYear)
                                Spacer()
                                DayView(componentSize: smallComponentSize, month: dualMonth, day: dualDay)
                            }
                        }

                    case .alarm:
                        HStack(spacing: 0) {
                            TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: false, hasSecond: false, hasMiliSecond: false, hour: 10, minute: 0, second: 0, miliSecond: 0)
                            DigitView(type: .hyphn, componentSize: defaultComponentSize)
                            DigitView(type: .one, componentSize: defaultComponentSize)
                        }
                        Spacer()
                        HStack(spacing: 0) {
                            TimeView(componentSize: smallComponentSize, timeComponentSize: nil, hasSecondDivider: false, hasSecond: false, hasMiliSecond: false, hour: hour, minute: minute, second: second, miliSecond: miliSecond)
                            Spacer()
                        }

                    case .stopWatch:
                        let interval = date.timeIntervalSince(baseDate)
                        let h = Int(interval / (60 * 60))
                        let m = Int((Int(interval) % (60 * 60)) / 60)
                        let s = Int(Int(interval) % 60)
                        TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: false, hasSecond: true, hasMiliSecond: false, hour: h, minute: m, second: s, miliSecond: 0)
                        Spacer()
                        HStack(spacing: 0) {
                            TimeView(componentSize: smallComponentSize, timeComponentSize: nil, hasSecondDivider: false, hasSecond: false, hasMiliSecond: false, hour: hour, minute: minute, second: second, miliSecond: miliSecond)
                            Spacer()
                        }

                    case .dualTime:
                        let dualYear = Calendar.current.component(.year, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualMonth = Calendar.current.component(.month, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualDay = Calendar.current.component(.day, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualHour = Calendar.current.component(.hour, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualMinute = Calendar.current.component(.minute, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualSecond = Calendar.current.component(.second, from: Date(timeInterval: dualTimeInterval, since: date))
                        let dualMiliSecond = Calendar.current.component(.nanosecond, from: Date(timeInterval: dualTimeInterval, since: date)) / 10000000

                        TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: false, hasSecond: true, hasMiliSecond: false, hour: dualHour, minute: dualMinute, second: dualSecond, miliSecond: dualMiliSecond)
                        Spacer()
                        HStack(spacing: 0) {
                            AgeView(componentSize: smallComponentSize, year: dualYear)
                            Spacer()
                            DayView(componentSize: smallComponentSize, month: dualMonth, day: dualDay)
                        }
                    }
                }
                .padding(10)
            }
        }
    }
}

#Preview {
    @State var currentDate:Date = Date()
    return VStack(spacing: 0) {
        Watch1View(date: $currentDate, mode: .clock)
        Watch1View(date: $currentDate, mode: .dataBank)
        Watch1View(date: $currentDate, mode: .calculator)
        Watch1View(date: $currentDate, mode: .alarm)
        Watch1View(date: $currentDate, mode: .stopWatch)
        Watch1View(date: $currentDate, mode: .dualTime)
    }
    .frame(width: 220)
}
