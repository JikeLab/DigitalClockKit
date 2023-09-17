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
    let secondDividerType: DividerType?
    let hasMiliSecond: Bool
    let hour: Int
    let minute: Int
    let second: Int
    let miliSecond: Int

    var body: some View {
        HStack(alignment: .bottom) {
            NumberView(value: hour, numberOfDigits: 2, zeroPadding: nil, componentSize: componentSize ?? timeComponentSize ?? defaultComponentSize)
            DividerView(dividerType: .colon, componentSize: componentSize ?? timeComponentSize ?? defaultComponentSize)
            NumberView(value: minute, numberOfDigits: 2, zeroPadding: true, componentSize: componentSize ?? timeComponentSize ?? defaultComponentSize)
            if let secondDividerType {
                DividerView(dividerType: secondDividerType, componentSize: componentSize ?? defaultComponentSize)
            }
            NumberView(value: second, numberOfDigits: 2, zeroPadding: true, componentSize: componentSize ?? defaultComponentSize)
            if hasMiliSecond {
                DividerView(dividerType: .period, componentSize: nil)
                NumberView(value: miliSecond, numberOfDigits: 2, zeroPadding: true, componentSize: componentSize ?? defaultComponentSize)
            }
        }
    }
}

#Preview {
    VStack {
        TimeView(componentSize: nil, timeComponentSize: nil, secondDividerType: .colon, hasMiliSecond: true, hour: 1, minute: 23, second: 45, miliSecond: 6)
        TimeView(componentSize: nil, timeComponentSize: largeComponentSize, secondDividerType: nil, hasMiliSecond: false, hour: 10, minute: 58, second: 50, miliSecond: 0)
    }
}
