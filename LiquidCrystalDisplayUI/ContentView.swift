//
//  ContentView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/08/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: AgeView()) {
                        Text("Age")
                    }
                    NavigationLink(destination: DayView()) {
                        Text("Day")
                    }
                    NavigationLink(destination: TimeView()) {
                        Text("Time")
                    }
                    NavigationLink(destination: WeekdayView()) {
                        Text("Weekday")
                    }
                } header: {
                    Text("DATE COMPONENTS")
                }
                Section {
                    ZStack {
                        VStack {
                            HStack {
                                AgeView()
                                DividerView(dividerType: .space)
                                DayView()
                                DividerView(dividerType: .space)
                                WeekdayView()
                            }
                            TimeView()
                        }
                        .padding()
                    }
                    .background(Color(red: (194 / 255), green: (216 / 255), blue: (214 / 255)))
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
