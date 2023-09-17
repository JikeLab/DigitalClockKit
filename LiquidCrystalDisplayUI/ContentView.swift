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
                    NavigationLink(destination: TimeView(componentSize: nil, hasMiliSecond: true, hour: hour, minute: minute, second: second, miliSecond: miliSecond)) {
                        Text("Time")
                    }
                    NavigationLink(destination: WeekdayView(componentSize: nil, weekday: weekday)) {
                        Text("Weekday")
                    }
                } header: {
                    Text("DATE COMPONENTS")
                }
                Section {
                    HStack {
                        Spacer()
                        Watch1View(date: $currentDate)
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
