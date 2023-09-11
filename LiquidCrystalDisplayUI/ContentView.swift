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
                    NavigationLink(destination: AgeView(componentSize: nil)) {
                        Text("Age")
                    }
                    NavigationLink(destination: DayView(componentSize: nil)) {
                        Text("Day")
                    }
                    NavigationLink(destination: TimeView(componentSize: nil)) {
                        Text("Time")
                    }
                    NavigationLink(destination: WeekdayView(componentSize: nil)) {
                        Text("Weekday")
                    }
                } header: {
                    Text("DATE COMPONENTS")
                }
                Section {
                    ZStack {
                        VStack {
                            HStack {
                                AgeView(componentSize: nil)
                                DividerView(dividerType: .space, componentSize: nil)
                                DayView(componentSize: nil)
                                DividerView(dividerType: .space, componentSize: nil)
                                WeekdayView(componentSize: nil)
                            }
                            TimeView(componentSize: nil)
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
