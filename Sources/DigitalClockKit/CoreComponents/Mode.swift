//
//  Mode.swift
//  DigitalClockKit
//
//  Created by Atsushi Jike on 2023/10/05.
//

import Foundation

enum Mode: CaseIterable {
    case clock
    case dataBank
    case calculator
    case alarm
    case stopWatch
    case dualTime

    var iconCoordinates: [Coordinate] {
        switch self {
        case .clock:
            return []
        case .dataBank:
            return [
                .init(x: 0, y: 0),
                .init(x: 1, y: 0),
                .init(x: 2, y: 0),
                .init(x: 3, y: 0),
                .init(x: 4, y: 0),
                .init(x: 0, y: 1),
                .init(x: 4, y: 1),
                .init(x: 1, y: 2),
                .init(x: 2, y: 2),
                .init(x: 3, y: 2),
                .init(x: 0, y: 3),
                .init(x: 1, y: 3),
                .init(x: 3, y: 3),
                .init(x: 4, y: 3),
                .init(x: 0, y: 4),
                .init(x: 1, y: 4),
                .init(x: 2, y: 4),
                .init(x: 3, y: 4),
                .init(x: 4, y: 4),
            ]
        case .calculator:
            return [
                .init(x: 0, y: 0),
                .init(x: 1, y: 0),
                .init(x: 2, y: 0),
                .init(x: 3, y: 0),
                .init(x: 4, y: 0),
                .init(x: 0, y: 1),
                .init(x: 1, y: 1),
                .init(x: 2, y: 1),
                .init(x: 3, y: 1),
                .init(x: 4, y: 1),
                .init(x: 0, y: 2),
                .init(x: 4, y: 2),
                .init(x: 0, y: 3),
                .init(x: 4, y: 3),
                .init(x: 0, y: 4),
                .init(x: 1, y: 4),
                .init(x: 2, y: 4),
                .init(x: 3, y: 4),
                .init(x: 4, y: 4),
            ]
        case .alarm:
            return [
                .init(x: 2, y: 0),
                .init(x: 1, y: 1),
                .init(x: 2, y: 1),
                .init(x: 3, y: 1),
                .init(x: 1, y: 2),
                .init(x: 2, y: 2),
                .init(x: 3, y: 2),
                .init(x: 0, y: 3),
                .init(x: 1, y: 3),
                .init(x: 2, y: 3),
                .init(x: 3, y: 3),
                .init(x: 4, y: 3),
                .init(x: 2, y: 4),
            ]
        case .stopWatch:
            return [
                .init(x: 1, y: 0),
                .init(x: 1, y: 1),
                .init(x: 2, y: 1),
                .init(x: 3, y: 1),
                .init(x: 0, y: 2),
                .init(x: 1, y: 2),
                .init(x: 2, y: 2),
                .init(x: 4, y: 2),
                .init(x: 1, y: 3),
                .init(x: 3, y: 3),
                .init(x: 4, y: 4),
            ]
        case .dualTime:
            return [
                .init(x: 1, y: 0),
                .init(x: 2, y: 0),
                .init(x: 3, y: 0),
                .init(x: 0, y: 1),
                .init(x: 2, y: 1),
                .init(x: 4, y: 1),
                .init(x: 0, y: 2),
                .init(x: 2, y: 2),
                .init(x: 3, y: 2),
                .init(x: 4, y: 2),
                .init(x: 0, y: 3),
                .init(x: 4, y: 3),
                .init(x: 1, y: 4),
                .init(x: 2, y: 4),
                .init(x: 3, y: 4),
            ]
        }
    }

    var labelCoordinateGrid: [[Coordinate]] {
        switch self {
        case .clock:
            return []
        case .dataBank:
            return [
                [
                    .init(x: 0, y: 0),
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 3, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 4, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 4, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 4, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 1, y: 4),
                    .init(x: 2, y: 4),
                    .init(x: 3, y: 4),
                ],
                [
                    .init(x: 0, y: 0),
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 3, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 4, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 1, y: 2),
                    .init(x: 2, y: 2),
                    .init(x: 3, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 4, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 1, y: 4),
                    .init(x: 2, y: 4),
                    .init(x: 3, y: 4),
                ],
            ]
        case .calculator:
            return [
                [
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 1, y: 4),
                    .init(x: 2, y: 4),
                ],
                [
                    .init(x: 1, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 2, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 1, y: 2),
                    .init(x: 2, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 2, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 2, y: 4),
                ],
                [
                    .init(x: 0, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 1, y: 4),
                    .init(x: 2, y: 4),
                ],
            ]
        case .alarm:
            return [
                [
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 3, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 4, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 1, y: 2),
                    .init(x: 2, y: 2),
                    .init(x: 3, y: 2),
                    .init(x: 4, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 4, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 4, y: 4),
                ],
                [
                    .init(x: 0, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 1, y: 4),
                    .init(x: 2, y: 4),
                    .init(x: 3, y: 4),
                    .init(x: 4, y: 4),
                ],
            ]
        case .stopWatch:
            return [
                [
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 3, y: 0),
                    .init(x: 4, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 1, y: 2),
                    .init(x: 2, y: 2),
                    .init(x: 3, y: 2),
                    .init(x: 4, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 1, y: 4),
                    .init(x: 2, y: 4),
                    .init(x: 3, y: 4),
                ],
                [
                    .init(x: 0, y: 0),
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 3, y: 0),
                    .init(x: 4, y: 0),
                    .init(x: 2, y: 1),
                    .init(x: 2, y: 2),
                    .init(x: 2, y: 3),
                    .init(x: 2, y: 4),
                ],
            ]
        case .dualTime:
            return [
                [
                    .init(x: 0, y: 0),
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 3, y: 0),
                    .init(x: 0, y: 1),
                    .init(x: 4, y: 1),
                    .init(x: 0, y: 2),
                    .init(x: 4, y: 2),
                    .init(x: 0, y: 3),
                    .init(x: 4, y: 3),
                    .init(x: 0, y: 4),
                    .init(x: 1, y: 4),
                    .init(x: 2, y: 4),
                    .init(x: 3, y: 4),
                ],
                [
                    .init(x: 0, y: 0),
                    .init(x: 1, y: 0),
                    .init(x: 2, y: 0),
                    .init(x: 3, y: 0),
                    .init(x: 4, y: 0),
                    .init(x: 2, y: 1),
                    .init(x: 2, y: 2),
                    .init(x: 2, y: 3),
                    .init(x: 2, y: 4),
                ],
            ]
        }
    }
}
