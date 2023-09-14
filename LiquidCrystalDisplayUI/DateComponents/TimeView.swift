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
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var second: Int
    @Binding var miliSecond: Int

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
    @State var hour: Int = 1
    @State var minute: Int = 23
    @State var second: Int = 45
    @State var miliSecond: Int = 6
    return TimeView(componentSize: nil, hasMiliSecond: true, hour: $hour, minute: $minute, second: $second, miliSecond: $miliSecond)
}
