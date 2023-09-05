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
                    Text("Components")
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
