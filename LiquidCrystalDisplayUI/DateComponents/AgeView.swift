//
//  AgeView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct AgeView: View {
    let year: Int = Calendar.current.component(.year, from: Date())

    var body: some View {
        NumberView(value: year)
    }
}

#Preview {
    AgeView()
}
