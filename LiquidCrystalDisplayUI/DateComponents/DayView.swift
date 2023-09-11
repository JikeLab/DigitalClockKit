//
//  DayView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct DayView: View {
    let componentSize: CGSize?
    let month: Int = Calendar.current.component(.month, from: Date())
    let day: Int = Calendar.current.component(.day, from: Date())
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
    DayView(componentSize: nil)
}
