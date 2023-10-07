//
//  BinaryInteger+Extension.swift
//  DigitalClockKit
//
//  Created by Atsushi Jike on 2023/10/04.
//

import Foundation

extension BinaryInteger {
    var digits: [Int] {
        String(describing: self).compactMap { Int(String($0)) }
    }
}
