//
//  TimeView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct TimeView: View {
    let componentSize: CGSize?
    let timeComponentSize: CGSize?
    let hasSecondDivider: Bool?
    let hasSecond: Bool
    let hasMiliSecond: Bool
    let hour: Int
    let minute: Int
    let second: Int
    let miliSecond: Int

    var body: some View {
        HStack(alignment: .bottom) {
            NumberView(value: hour, numberOfDigits: 2, zeroPadding: nil, componentSize: timeComponentSize ?? componentSize ?? defaultComponentSize)
            DigitView(value: 10, componentSize: timeComponentSize ?? componentSize ?? defaultComponentSize)
            NumberView(value: minute, numberOfDigits: 2, zeroPadding: true, componentSize: timeComponentSize ?? componentSize ?? defaultComponentSize)
            if let hasSecondDivider {
                DigitView(value: hasSecondDivider ? 10 : 12, componentSize: componentSize ?? defaultComponentSize)
            }
            if hasSecond {
                NumberView(value: second, numberOfDigits: 2, zeroPadding: true, componentSize: componentSize ?? defaultComponentSize)
            }
            if hasMiliSecond {
                DigitView(value: 12, componentSize: componentSize ?? defaultComponentSize)
                NumberView(value: miliSecond, numberOfDigits: 2, zeroPadding: true, componentSize: componentSize ?? defaultComponentSize)
            }
        }
    }
}

#Preview {
    VStack {
        TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: true, hasSecond: true, hasMiliSecond: true, hour: 1, minute: 23, second: 45, miliSecond: 6)
        TimeView(componentSize: nil, timeComponentSize: largeComponentSize, hasSecondDivider: false, hasSecond: true, hasMiliSecond: false, hour: 10, minute: 58, second: 50, miliSecond: 0)
    }
}
