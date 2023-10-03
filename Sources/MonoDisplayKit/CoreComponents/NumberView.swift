//
//  NumberView.swift
//  MonoDisplayKit
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct NumberView: View {
    let value: Int
    let numberOfDigits: Int?
    let zeroPadding: Bool?
    let componentSize: CGSize

    var body: some View {
        HStack {
            // 足らない桁を0で埋める
            if let numberOfDigits, numberOfDigits > value.digits.count {
                ForEach(0..<(numberOfDigits - value.digits.count), id: \.self) { _ in
                    if zeroPadding ?? false {
                        DigitView(type: .zero, componentSize: componentSize)
                    } else {
                        DigitView(type: .space, componentSize: componentSize)
                    }
                }
            }

            ForEach(value.digits, id: \.self) { digit in
                if let type = DigitType(rawValue: digit) {
                    DigitView(type: type, componentSize: componentSize)
                }
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
        NumberView(value: 2023, numberOfDigits: 4, zeroPadding: nil, componentSize: defaultComponentSize)
        NumberView(value: 7, numberOfDigits: 2, zeroPadding: true, componentSize: defaultComponentSize)
        NumberView(value: 12, numberOfDigits: 3, zeroPadding: false, componentSize: defaultComponentSize)
    }
}
