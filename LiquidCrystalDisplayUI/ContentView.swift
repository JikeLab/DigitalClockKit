//
//  ContentView.swift
//  LiquidCrystalDisplayUI
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

                Section {
                    NavigationLink(destination: AgeView(componentSize: nil, year: year)) {
                        Text("Age")
                    }
                    NavigationLink(destination: DayView(componentSize: nil, month: month, day: day)) {
                        Text("Day")
                    }
                    NavigationLink(destination: TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: true, hasMiliSecond: true, hour: hour, minute: minute, second: second, miliSecond: miliSecond)) {
                        Text("Time")
                    }
                    NavigationLink(destination: WeekdayView(componentSize: nil, weekday: weekday, shorten: false)) {
                        Text("Weekday")
                    }
                } header: {
                    Text("DATE COMPONENTS")
                }
                Section {
                    HStack {
                        Spacer()
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(Watch1View.Mode.allCases, id: \.self) { mode in
                                    Watch1View(date: $currentDate, mode: mode)
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
                                Watch2View(date: $currentDate)
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
            .navigationTitle("Liquid Crystal Display")
        }.onReceive(timer){ value in
            currentDate = value
        }
    }
}

#Preview {
    ContentView()
}
