//
//  DividerView.swift
//  MonochromeKit
//
//  Created by Atsushi Jike on 2023/10/01.
//

import SwiftUI

struct DividerView: View {
    let componentSize: CGSize

    var body: some View {
        ZStack {
            let radius = componentSize.width / 6
            Path { path in
                path.addArc(
                    center: CGPoint(x: componentSize.width / 2, y: (componentSize.height / 4)),
                    radius: radius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360),
                    clockwise: false
                )
                path.closeSubpath()
            }
            Path { path in
                path.addArc(
                    center: CGPoint(x: componentSize.width / 2, y: (componentSize.height / 4 * 3)),
                    radius: radius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360),
                    clockwise: false
                )
                path.closeSubpath()
            }
        }
        .frame(width: componentSize.width, height: componentSize.height)
    }
}

#Preview {
    DividerView(componentSize: defaultComponentSize)
}
