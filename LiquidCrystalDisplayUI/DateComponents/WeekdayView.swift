//
//  WeekdayView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

enum WeekdayType: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday

    var coordinateGrid: [[Coordinate]] {
        switch self {
        case .sunday:
            return [
                // S
                [.init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 4, y: 3), .init(x: 3, y: 4), .init(x: 2, y: 4), .init(x: 1, y: 4), .init(x: 0, y: 4)],
                // U
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
                // N
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 1), .init(x: 2, y: 2), .init(x: 3, y: 3), .init(x: 4, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
            ]
        case .monday:
            return [
                // M
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 1), .init(x: 2, y: 2), .init(x: 3, y: 1), .init(x: 4, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3), .init(x: 4, y: 4)],
                // O
                [ .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1)],
                // N
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 1), .init(x: 2, y: 2), .init(x: 3, y: 3), .init(x: 4, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
            ]
        case .tuesday:
            return [
                // T
                [ .init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 2, y: 4)],
                // U
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
                // E
                [ .init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 4)],
            ]
        case .wednesday:
            return [
                // W
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 3), .init(x: 2, y: 2), .init(x: 3, y: 3), .init(x: 4, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3), .init(x: 4, y: 4)],
                // E
                [ .init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 4)],
                // D
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3), .init(x: 3, y: 4), .init(x: 2, y: 4), .init(x: 1, y: 4)],
            ]
        case .thursday:
            return [
                // T
                [ .init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 2, y: 4)],
                // H
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 4, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3), .init(x: 4, y: 4)],
                // U
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
            ]
        case .friday:
            return [
                // F
                [ .init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2)],
                // R
                [ .init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 1), .init(x: 3, y: 2), .init(x: 2, y: 2), .init(x: 1, y: 2), .init(x: 4, y: 3), .init(x: 4, y: 4)],
                // I
                [ .init(x: 2, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 2, y: 4)],
            ]
        case .saturday:
            return [
                // S
                [.init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 4, y: 3), .init(x: 3, y: 4), .init(x: 2, y: 4), .init(x: 1, y: 4), .init(x: 0, y: 4)],
                // A
                [ .init(x: 2, y: 0), .init(x: 1, y: 1), .init(x: 3, y: 1), .init(x: 1, y: 2), .init(x: 3, y: 2), .init(x: 0, y: 3), .init(x: 4, y: 3), .init(x: 2, y: 2), .init(x: 0, y: 4), .init(x: 4, y: 4)],
                // T
                [ .init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 2, y: 4)],
            ]
        }
    }
}

struct WeekdayView: View {

    let componentSize: CGSize?
    @Binding var weekday: Int

    var body: some View {
        if let weekdayType = WeekdayType(rawValue: weekday) {
            WeekdayContentView(weekdayType: weekdayType, componentSize: componentSize ?? defaultComponentSize)
        }
    }
}

struct WeekdayContentView: View {

    let weekdayType: WeekdayType
    let componentSize: CGSize

    var body: some View {
        HStack {
            ForEach(weekdayType.coordinateGrid, id: \.self) { coordinates in
                MatrixView(coordinates: coordinates, componentSize: componentSize, color: Color.black, margin: 0)
            }
        }
        
    }
}

#Preview {
    VStack {
        WeekdayContentView(weekdayType: .sunday, componentSize: defaultComponentSize)
        WeekdayContentView(weekdayType: .monday, componentSize: defaultComponentSize)
        WeekdayContentView(weekdayType: .tuesday, componentSize: defaultComponentSize)
        WeekdayContentView(weekdayType: .wednesday, componentSize: defaultComponentSize)
        WeekdayContentView(weekdayType: .thursday, componentSize: defaultComponentSize)
        WeekdayContentView(weekdayType: .friday, componentSize: defaultComponentSize)
        WeekdayContentView(weekdayType: .saturday, componentSize: defaultComponentSize)
    }
}
