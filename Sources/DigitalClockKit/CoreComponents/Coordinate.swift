//
//  Coordinate.swift
//  DigitalClockKit
//
//  Created by Atsushi Jike on 2023/09/08.
//

import Foundation

let defaultComponentSize = CGSize(width: 18, height: 30)
let largeComponentSize = CGSize(width: 24, height: 40)
let mediumComponentSize = CGSize(width: 15, height: 25)
let smallComponentSize = CGSize(width: 12, height: 20)
let matrixComponentSize = CGSize(width: 18, height: 18)

struct Coordinate: Equatable {
    let x: Int
    let y: Int

    static func == (ldh: Coordinate, rdh: Coordinate) -> Bool {
        ldh.x == rdh.x && ldh.y == rdh.y
    }
}

extension Coordinate: Hashable {}
