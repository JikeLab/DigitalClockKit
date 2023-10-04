//
//  DigitContainerView.swift
//  MonoDisplayKit
//
//  Created by Atsushi Jike on 2023/10/04.
//

import SwiftUI

struct DigitContainerView: View {
    let value: String
    let componentSize: CGSize
    let spacing: CGFloat

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(Array(value), id: \.self) { character in
                let string = String(character)
                if let intValue = Int(string),
                   let type = DigitType(rawValue: intValue) {
                    DigitView(type: type, componentSize: componentSize)
                } else if string == "-" {
                    DigitView(type: .hyphn, componentSize: componentSize)
                } else if string == " " {
                    DigitView(type: .space, componentSize: componentSize)
                } else if string == "." {
                    MatrixView(coordinates: [.init(x: 0, y: 4)], maxMatrix: .init(x: 0, y: 4), componentSize: .init(width: componentSize.height / 5, height: componentSize.height), color: Color.black, margin: 2)
                }
            }
        }
    }
}

#Preview {
    VStack {
        DigitContainerView(value: "012", componentSize: defaultComponentSize, spacing: 2)
        DigitContainerView(value: "012-3456-7890", componentSize: defaultComponentSize, spacing: 1)
        DigitContainerView(value: "012 3456-7890", componentSize: defaultComponentSize, spacing: 1)
        DigitContainerView(value: "123.45", componentSize: defaultComponentSize, spacing: 1)
    }
}
