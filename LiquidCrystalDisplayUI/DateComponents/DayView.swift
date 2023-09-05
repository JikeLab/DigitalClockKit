//
//  DayView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct DayView: View {
    let month: Int = Calendar.current.component(.month, from: Date())
    let day: Int = Calendar.current.component(.day, from: Date())
    let divider: DividerView.DividerType = .hyphn

    var body: some View {
        HStack {
            NumberView(value: month)
            DividerView(dividerType: divider)
            NumberView(value: day)
        }
    }
}

#Preview {
    DayView()
}
