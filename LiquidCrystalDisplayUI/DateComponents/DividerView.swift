//
//  DividerView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

struct DividerView: View {
    enum DividerType {
        case colon
        case period
        case hyphn
        case space
    }

    let dividerType: DividerType

    var body: some View {
        switch dividerType {
        case .colon:
            Text(":")
        case .period:
            Text(".")
        case .hyphn:
            Text("-")
        case .space:
            Text(" ")
        }
    }
}

#Preview {
    DividerView(dividerType: .colon)
}
