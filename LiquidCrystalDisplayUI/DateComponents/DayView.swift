//
//  DayView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct DayView: View {
    let componentSize: CGSize?
    @Binding var month: Int
    @Binding var day: Int
    let divider: DividerType = .hyphn

    var body: some View {
        HStack {
            NumberView(value: month, numberOfDigits: nil, componentSize: componentSize ?? defaultComponentSize)
            DividerView(dividerType: divider, componentSize: componentSize ?? defaultComponentSize)
            NumberView(value: day, numberOfDigits: nil, componentSize: componentSize ?? defaultComponentSize)
        }
    }
}

#Preview {
    @State var month: Int = 1
    @State var day: Int = 23
    return DayView(componentSize: nil, month: $month, day: $day)
}
