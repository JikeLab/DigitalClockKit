//
//  ContentView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/08/20.
//

import SwiftUI

struct ContentView: View {
    @State var year: Int = Calendar.current.component(.year, from: Date())
    @State var month: Int = Calendar.current.component(.month, from: Date())
    @State var day: Int = Calendar.current.component(.day, from: Date())
    @State var weekday: Int = Calendar.current.component(.weekday, from: Date())
    @State var hour: Int = Calendar.current.component(.hour, from: Date())
    @State var minute: Int = Calendar.current.component(.minute, from: Date())
    @State var second: Int = Calendar.current.component(.second, from: Date())
    @State var miliSecond: Int = Calendar.current.component(.nanosecond, from: Date()) / 10000000

    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: AgeView(componentSize: nil, year: $year)) {
                        Text("Age")
                    }
                    NavigationLink(destination: DayView(componentSize: nil, month: $month, day: $day)) {
                        Text("Day")
                    }
                    NavigationLink(destination: TimeView(componentSize: nil, hasMiliSecond: true, hour: $hour, minute: $minute, second: $second, miliSecond: $miliSecond)) {
                        Text("Time")
                    }
                    NavigationLink(destination: WeekdayView(componentSize: nil, weekday: $weekday)) {
                        Text("Weekday")
                    }
                } header: {
                    Text("DATE COMPONENTS")
                }
                Section {
                    HStack {
                        Spacer()
                        DisplayView()
                        Spacer()
                    }
                } header: {
                    Text("SAMPLE CLOCK")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Liquid Crystal Display")
        }
    }
}

#Preview {
    ContentView()
}
