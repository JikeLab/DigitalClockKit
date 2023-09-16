//
//  TimeView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct TimeView: View {
    let componentSize: CGSize?
    let hasMiliSecond: Bool
    let hour: Int
    let minute: Int
    let second: Int
    let miliSecond: Int

    var body: some View {
        HStack {
            NumberView(value: hour, numberOfDigits: nil, componentSize: componentSize ?? defaultComponentSize)
            DividerView(dividerType: .colon, componentSize: nil)
            NumberView(value: minute, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
            DividerView(dividerType: .space, componentSize: nil)
            NumberView(value: second, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
            if hasMiliSecond {
                DividerView(dividerType: .period, componentSize: nil)
                NumberView(value: miliSecond, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
            }
        }
    }
}

#Preview {
    TimeView(componentSize: nil, hasMiliSecond: true, hour: 1, minute: 23, second: 45, miliSecond: 6)
}
