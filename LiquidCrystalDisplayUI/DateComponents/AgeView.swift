//
//  AgeView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct AgeView: View {
    let componentSize: CGSize?
    let year: Int

    var body: some View {
        NumberView(value: year, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
    }
}

#Preview {
    AgeView(componentSize: nil, year: 2023)
}
