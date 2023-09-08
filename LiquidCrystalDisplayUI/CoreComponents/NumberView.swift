//
//  NumberView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct NumberView: View {
    let value: Int
    let numberOfDigits: Int?
    // 桁数設定

    var body: some View {
        HStack {
            // 足らない桁を0で埋める
            if let numberOfDigits = numberOfDigits, numberOfDigits > value.digits.count {
                ForEach(0..<(numberOfDigits - value.digits.count), id: \.self) { _ in
                    DigitView(value: 0)
                }
            }

            ForEach(value.digits, id: \.self) { digit in
                DigitView(value: digit)
            }
        }
    }
}

extension BinaryInteger {
    var digits: [Int] {
        String(describing: self).compactMap { Int(String($0)) }
    }
}

#Preview {
    VStack {
        NumberView(value: 2023, numberOfDigits: nil)
        NumberView(value: 7, numberOfDigits: 2)
    }
}
