//
//  MatrixView.swift
//  MonoDisplayKit
//
//  Created by Atsushi Jike on 2023/09/08.
//

import SwiftUI

struct MatrixView: View {
    let coordinates: [Coordinate]
    let maxMatrix: Coordinate?
    let componentSize: CGSize
    let color: Color
    var matrix: Coordinate {
        let maxX = maxMatrix?.x ?? coordinates.max { $0.x < $1.x }.map { $0.x } ?? 0
        let maxY = maxMatrix?.y ?? coordinates.max { $0.y < $1.y }.map { $0.y } ?? 0
        return .init(x: maxX + 1, y: maxY + 1)
    }
    let margin: CGFloat

    var body: some View {
        ZStack {
            let blockSize: (CGFloat, CGFloat) = (componentSize.width / CGFloat(matrix.x), componentSize.height / CGFloat(matrix.y))
            ForEach(0..<matrix.x, id: \.self) { x in
                ForEach(0..<matrix.y, id: \.self) { y in
                    if coordinates.contains(Coordinate(x: x, y: y)) {
                        Path { path in
                            path.move(to: CGPoint(x: (CGFloat(x) * blockSize.0 + margin / 2), y: (CGFloat(y) * blockSize.1 + margin / 2)))
                            path.addLine(to: CGPoint(x: (CGFloat(x + 1) * blockSize.0 - margin / 2), y: (CGFloat(y) * blockSize.1 + margin / 2)))
                            path.addLine(to: CGPoint(x: (CGFloat(x + 1) * blockSize.0 - margin / 2), y: (CGFloat(y + 1) * blockSize.1 - margin / 2)))
                            path.addLine(to: CGPoint(x: (CGFloat(x) * blockSize.0 + margin / 2), y: (CGFloat(y + 1) * blockSize.1 - margin / 2)))
                            path.addLine(to: CGPoint(x: (CGFloat(x) * blockSize.0 + margin / 2), y: (CGFloat(y) * blockSize.1 + margin / 2)))
                        }
                        .fill(color)
                    }
                    
                }
            }
        }
        .frame(width: componentSize.width, height: componentSize.height)
    }
}

#Preview {
    VStack {
        MatrixView(
            coordinates: [
                .init(x: 2, y: 0),
                .init(x: 1, y: 1),
                .init(x: 3, y: 1),
                .init(x: 1, y: 2),
                .init(x: 3, y: 2),
                .init(x: 0, y: 3),
                .init(x: 4, y: 3),
                .init(x: 2, y: 2),
                .init(x: 0, y: 4),
                .init(x: 4, y: 4)
            ],
            maxMatrix: nil,
            componentSize: defaultComponentSize, color: Color.black, margin: 1
        )
        MatrixView(
            coordinates: [
                .init(x: 1, y: 2),
                .init(x: 2, y: 2),
                .init(x: 3, y: 2),
            ],
            maxMatrix: .init(x: 5, y: 5),
            componentSize: defaultComponentSize, color: Color.black, margin: 1
        )
    }
}
