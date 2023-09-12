//
//  AgeView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct AgeView: View {
    let componentSize: CGSize?
    @Binding var year: Int

    var body: some View {
        NumberView(value: year, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
    }
}

#Preview {
    @State var year: Int = 2023
    return AgeView(componentSize: nil, year: $year)
}
