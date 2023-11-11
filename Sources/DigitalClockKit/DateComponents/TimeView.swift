//
//  TimeView.swift
//  DigitalClockKit
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct TimeView: View {
    let componentSize: CGSize?
    let timeComponentSize: CGSize?
    let hasSecondDivider: Bool
    let hasSecond: Bool
    let hasMiliSecond: Bool
    let hour: Int
    let minute: Int
    let second: Int
    let miliSecond: Int
    let is24Hour: Bool

    var body: some View {
        HStack(alignment: .bottom) {
            NumberView(value: is24Hour ? hour : (hour < 12 ? hour : hour - 12), numberOfDigits: 2, zeroPadding: nil, componentSize: timeComponentSize ?? componentSize ?? defaultComponentSize)
            DividerView(componentSize: timeComponentSize ?? componentSize ?? defaultComponentSize)
            NumberView(value: minute, numberOfDigits: 2, zeroPadding: true, componentSize: timeComponentSize ?? componentSize ?? defaultComponentSize)
            if hasSecondDivider {
                DividerView(componentSize: componentSize ?? defaultComponentSize)
            } else if let space = DigitType(rawValue: 11) {
                DigitView(type: space, componentSize: componentSize ?? defaultComponentSize)
            }
            if hasSecond {
                NumberView(value: second, numberOfDigits: 2, zeroPadding: true, componentSize: componentSize ?? defaultComponentSize)
            }
            if hasMiliSecond {
                DigitView(type: .space, componentSize: componentSize ?? defaultComponentSize)
                NumberView(value: miliSecond, numberOfDigits: 2, zeroPadding: true, componentSize: componentSize ?? defaultComponentSize)
            }
        }
    }
}

#Preview {
    VStack {
        TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: true, hasSecond: true, hasMiliSecond: true, hour: 12, minute: 34, second: 56, miliSecond: 7, is24Hour: true)
        TimeView(componentSize: nil, timeComponentSize: nil, hasSecondDivider: true, hasSecond: true, hasMiliSecond: true, hour: 12, minute: 34, second: 56, miliSecond: 7, is24Hour: false)
        TimeView(componentSize: nil, timeComponentSize: largeComponentSize, hasSecondDivider: false, hasSecond: true, hasMiliSecond: false, hour: 22, minute: 58, second: 50, miliSecond: 0, is24Hour: true)
        TimeView(componentSize: nil, timeComponentSize: largeComponentSize, hasSecondDivider: false, hasSecond: true, hasMiliSecond: false, hour: 22, minute: 58, second: 50, miliSecond: 0, is24Hour: false)
    }
}
