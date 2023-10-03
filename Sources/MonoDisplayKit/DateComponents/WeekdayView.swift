//
//  WeekdayView.swift
//  MonoDisplayKit
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
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
                // N
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 1), .init(x: 2, y: 2), .init(x: 3, y: 3), .init(x: 4, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
            ]
        case .monday:
            return [
                // M
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 1), .init(x: 2, y: 2), .init(x: 3, y: 1), .init(x: 4, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3), .init(x: 4, y: 4)],
                // O
                [.init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1)],
                // N
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 1), .init(x: 2, y: 2), .init(x: 3, y: 3), .init(x: 4, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
            ]
        case .tuesday:
            return [
                // T
                [.init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 2, y: 4)],
                // U
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
                // E
                [.init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 4)],
            ]
        case .wednesday:
            return [
                // W
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 3, y: 4), .init(x: 4, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3)],
                // E
                [.init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 4)],
                // D
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3), .init(x: 3, y: 4), .init(x: 2, y: 4), .init(x: 1, y: 4)],
            ]
        case .thursday:
            return [
                // T
                [.init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 2, y: 4)],
                // H
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 4, y: 0), .init(x: 4, y: 1), .init(x: 4, y: 2), .init(x: 4, y: 3), .init(x: 4, y: 4)],
                // U
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4), .init(x: 4, y: 3), .init(x: 4, y: 2), .init(x: 4, y: 1), .init(x: 4, y: 0)],
            ]
        case .friday:
            return [
                // F
                [.init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2)],
                // R
                [.init(x: 0, y: 0), .init(x: 0, y: 1), .init(x: 0, y: 2), .init(x: 0, y: 3), .init(x: 0, y: 4), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 1), .init(x: 3, y: 2), .init(x: 2, y: 2), .init(x: 1, y: 2), .init(x: 4, y: 3), .init(x: 4, y: 4)],
                // I
                [.init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 1, y: 4), .init(x: 2, y: 4), .init(x: 3, y: 4)],
            ]
        case .saturday:
            return [
                // S
                [.init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 0, y: 1), .init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2), .init(x: 4, y: 3), .init(x: 3, y: 4), .init(x: 2, y: 4), .init(x: 1, y: 4), .init(x: 0, y: 4)],
                // A
                [.init(x: 2, y: 0), .init(x: 1, y: 1), .init(x: 3, y: 1), .init(x: 1, y: 2), .init(x: 3, y: 2), .init(x: 0, y: 3), .init(x: 4, y: 3), .init(x: 2, y: 2), .init(x: 0, y: 4), .init(x: 4, y: 4)],
                // T
                [.init(x: 0, y: 0), .init(x: 1, y: 0), .init(x: 2, y: 0), .init(x: 3, y: 0), .init(x: 4, y: 0), .init(x: 2, y: 1), .init(x: 2, y: 2), .init(x: 2, y: 3), .init(x: 2, y: 4)],
            ]
        }
    }

    var digitTypes: [DigitType] {
        switch self {
        case .sunday:
            return [.s, .u]
        case .monday:
            return [.m, .o]
        case .tuesday:
            return [.t, .u]
        case .wednesday:
            return [.w, .e]
        case .thursday:
            return [.t, .h]
        case .friday:
            return [.f, .r]
        case .saturday:
            return [.s, .a]
        }
    }
}

struct WeekdayView: View {
    enum Edition {
        case matrix
        case digit
    }
    
    let edition: Edition
    let componentSize: CGSize?
    let weekday: Int

    var body: some View {
        if let weekdayType = WeekdayType(rawValue: weekday) {
            switch edition {
            case .matrix:
                HStack {
                    ForEach(weekdayType.coordinateGrid, id: \.self) { coordinates in
                        MatrixView(coordinates: coordinates, maxMatrix: .init(x: 4, y: 4), componentSize: componentSize ?? defaultComponentSize, color: Color.black, margin: 0)
                    }
                }
            case .digit:
                HStack {
                    ForEach(weekdayType.digitTypes, id: \.self) { type in
                        DigitView(type: type, componentSize: componentSize ?? defaultComponentSize)
                    }
                }
            }
        }
    }
}

#Preview {
    VStack {
        HStack {
            Spacer()
            WeekdayView(edition: .matrix, componentSize: nil, weekday: 1)
            Spacer()
            WeekdayView(edition: .digit, componentSize: nil, weekday: 1)
            Spacer()
        }
        HStack {
            Spacer()
            WeekdayView(edition: .matrix, componentSize: nil, weekday: 2)
            Spacer()
            WeekdayView(edition: .digit, componentSize: nil, weekday: 2)
            Spacer()
        }
        HStack {
            Spacer()
            WeekdayView(edition: .matrix, componentSize: nil, weekday: 3)
            Spacer()
            WeekdayView(edition: .digit, componentSize: nil, weekday: 3)
            Spacer()
        }
        HStack {
            Spacer()
            WeekdayView(edition: .matrix, componentSize: nil, weekday: 4)
            Spacer()
            WeekdayView(edition: .digit, componentSize: nil, weekday: 4)
            Spacer()
        }
        HStack {
            Spacer()
            WeekdayView(edition: .matrix, componentSize: nil, weekday: 5)
            Spacer()
            WeekdayView(edition: .digit, componentSize: nil, weekday: 5)
            Spacer()
        }
        HStack {
            Spacer()
            WeekdayView(edition: .matrix, componentSize: nil, weekday: 6)
            Spacer()
            WeekdayView(edition: .digit, componentSize: nil, weekday: 6)
            Spacer()
        }
        HStack {
            Spacer()
            WeekdayView(edition: .matrix, componentSize: nil, weekday: 7)
            Spacer()
            WeekdayView(edition: .digit, componentSize: nil, weekday: 7)
            Spacer()
        }
    }
}
