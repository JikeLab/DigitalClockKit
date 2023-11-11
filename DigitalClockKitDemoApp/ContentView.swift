//
//  ContentView.swift
//  DigitalClockKit
//
//  Created by Atsushi Jike on 2023/08/20.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()
    @State var currentDate:Date = Date()

    var body: some View {
        NavigationView {
            List {
                let year = Calendar.current.component(.year, from: currentDate)
                let month = Calendar.current.component(.month, from: currentDate)
                let day = Calendar.current.component(.day, from: currentDate)
                let weekday = Calendar.current.component(.weekday, from: currentDate)
                let hour = Calendar.current.component(.hour, from: currentDate)
                let minute = Calendar.current.component(.minute, from: currentDate)
                let second = Calendar.current.component(.second, from: currentDate)
                let miliSecond = Calendar.current.component(.nanosecond, from: currentDate) / 10000000

                // TODO: Components のプレゼン方法を変える
                Section {
                    HStack {
                        Text("Year")
                        Spacer()
                        AgeView(componentSize: mediumComponentSize, year: year)
                    }
                    HStack {
                        Text("Day")
                        Spacer()
                        DayView(componentSize: mediumComponentSize, month: month, day: day)
                    }
                    HStack {
                        Text("Time")
                        Spacer()
                        TimeView(componentSize: mediumComponentSize, timeComponentSize: nil, hasSecondDivider: true, hasSecond: true, hasMiliSecond: true, hour: hour, minute: minute, second: second, miliSecond: miliSecond, is24Hour: false)
                    }
                    HStack {
                        Text("Weekday")
                        Spacer()
                        HStack {
                            WeekdayView(edition: .matrix, componentSize: mediumComponentSize, weekday: weekday)
                                .padding(.trailing, 10)
                            WeekdayView(edition: .digit, componentSize: mediumComponentSize, weekday: weekday)
                        }
                    }
                    HStack {
                        Text("Telephone")
                        Spacer()
                        DigitContainerView(value: "012-3456-7890", componentSize: mediumComponentSize, spacing: 0.4)
                    }
                    HStack {
                        Text("Number")
                        Spacer()
                        DigitContainerView(value: "123.45", componentSize: defaultComponentSize, spacing: 1)
                    }
                    HStack {
                        Text("Icons")
                        Spacer()
                        HStack {
                            MatrixView(coordinates: Mode.dataBank.iconCoordinates, maxMatrix: nil, componentSize: CGSize(width:18, height: 18), color: Color.black, margin: 0)
                            MatrixView(coordinates: Mode.calculator.iconCoordinates, maxMatrix: nil, componentSize: CGSize(width:18, height: 18), color: Color.black, margin: 0)
                            MatrixView(coordinates: Mode.alarm.iconCoordinates, maxMatrix: nil, componentSize: CGSize(width:18, height: 18), color: Color.black, margin: 0)
                            MatrixView(coordinates: Mode.stopWatch.iconCoordinates, maxMatrix: nil, componentSize: CGSize(width:18, height: 18), color: Color.black, margin: 0)
                            MatrixView(coordinates: Mode.dualTime.iconCoordinates, maxMatrix: nil, componentSize: CGSize(width:18, height: 18), color: Color.black, margin: 0)
                        }
                    }
                } header: {
                    Text("COMPONENTS")
                }
                Section {
                    HStack {
                        Spacer()
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(Mode.allCases, id: \.self) { mode in
                                    Watch1View(date: $currentDate, mode: mode, is24Hour: false)
                                        .frame(width: 220)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.paging)
                        .frame(width: 220)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                Watch2View(date: $currentDate, is24Hour: true)
                                    .frame(width: 250)
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.paging)
                        .frame(width: 250)
                        Spacer()
                    }
                } header: {
                    Text("SAMPLES")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("DigitalClockKit")
        }.onReceive(timer){ value in
            currentDate = value
        }
    }
}

#Preview {
    ContentView()
}
