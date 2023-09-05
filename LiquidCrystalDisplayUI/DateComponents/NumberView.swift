//
//  NumberView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct NumberView: View {
    let value: Int

    var body: some View {
        Text("\(value)")
    }
}

#Preview {
    NumberView(value: 0)
}
