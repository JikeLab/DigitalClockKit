//
//  DividerView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/04.
//

import SwiftUI

enum DividerType {
    case colon
    case period
    case hyphn
    case space

    var coordinates: [Coordinate] {
        switch self {
        case .colon:
            return [.init(x: 2, y: 1), .init(x: 2, y: 3)]
        case .period:
            return [.init(x: 0, y: 4)]
        case .hyphn:
            return [.init(x: 1, y: 2), .init(x: 2, y: 2), .init(x: 3, y: 2)]
        case .space:
            return []
        }
    }
}

struct DividerView: View {

    let dividerType: DividerType
    let componentSize: CGSize?

    var body: some View {
        ZStack {
            MatrixView(coordinates: dividerType.coordinates, componentSize: componentSize ?? defaultComponentSize, color: Color.black, margin: 0)
        }
    }
}

#Preview {
    HStack {
        DividerView(dividerType: .colon, componentSize: nil)
        DividerView(dividerType: .period, componentSize: nil)
        DividerView(dividerType: .hyphn, componentSize: nil)
        DividerView(dividerType: .space, componentSize: nil)
    }
}
