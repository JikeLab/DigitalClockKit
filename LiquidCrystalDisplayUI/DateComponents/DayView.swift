//
//  DayView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct DayView: View {
    let componentSize: CGSize?
    let month: Int?
    let day: Int

    var body: some View {
        HStack {
            if let month {
                NumberView(value: month, numberOfDigits: 2, zeroPadding: nil, componentSize: componentSize ?? defaultComponentSize)
                DigitView(value: 11, componentSize: componentSize ?? defaultComponentSize)
            }
            NumberView(value: day, numberOfDigits: 2, zeroPadding: (month != nil), componentSize: componentSize ?? defaultComponentSize)
        }
    }
}

#Preview {
    DayView(componentSize: nil, month: 1, day: 23)
}
