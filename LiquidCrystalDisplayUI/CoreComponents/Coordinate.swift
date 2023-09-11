//
//  Coordinate.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/08.
//

import Foundation

let defaultComponentSize = CGSize(width: 18, height: 30)

struct Coordinate: Equatable {
    let x: Int
    let y: Int

    static func == (ldh: Coordinate, rdh: Coordinate) -> Bool {
        ldh.x == rdh.x && ldh.y == rdh.y
    }
}

extension Coordinate: Hashable {}
