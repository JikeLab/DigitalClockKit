//
//  WeekdayView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct WeekdayView: View {
    enum WeekdayType: Int {
        case sunday = 1
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }

    let weekdayType = WeekdayType(rawValue: Calendar.current.component(.weekday, from: Date()))

    var body: some View {
        switch weekdayType {
        case .sunday:
            Text("SUN")
        case .monday:
            Text("MON")
        case .tuesday:
            Text("TUE")
        case .wednesday:
            Text("WED")
        case .thursday:
            Text("THU")
        case .friday:
            Text("FRI")
        case .saturday:
            Text("SAT")
        case .none:
            Text("NON")
        }
        
    }
}

#Preview {
    WeekdayView()
}
