//
//  DigitView.swift
//  MonochromeKit
//
//  Created by Atsushi Jike on 2023/09/05.
//

import SwiftUI

struct DigitView: View {
    let value: Int
    let componentSize: CGSize

    var body: some View {
        ZStack {
            DigitContentView(type: .init(rawValue: value), componentSize: componentSize, inset: 1, margin: 1, color: Color.black)
        }
    }
}

private struct DigitContentView: View {
    enum DigitType: Int {
        case zero
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case colon
        case hyphn
        case space

        var paths: PathFlags {
            switch self {
            case .zero:
                return [.top, .rightTop, .rightBottom, .bottom, .leftTop, .leftBottom]
            case .one:
                return [.rightTop, .rightBottom]
            case .two:
                return [.top, .rightTop, .center, .leftBottom, .bottom]
            case .three:
                return [.top, .rightTop, .rightBottom, .center, .bottom]
            case .four:
                return [.leftTop, .rightTop, .center, .rightBottom]
            case .five:
                return [.top, .leftTop, .center, .rightBottom, .bottom]
            case .six:
                return [.top, .leftTop, .leftBottom, .center, .rightBottom, .bottom]
            case .seven:
                return [.top, .rightTop, .rightBottom]
            case .eight:
                return [.top, .leftTop, .leftBottom, .center, .rightTop, .rightBottom, .bottom]
            case .nine:
                return [.top, .leftTop, .center, .rightTop, .rightBottom, .bottom]
            case .colon:
                return [.colon]
            case .hyphn:
                return [.center]
            case .space:
                return []
            }
        }
    }
    struct PathFlags: OptionSet {
        let rawValue: Int
        static let top = PathFlags(rawValue: 1 << 0)
        static let rightTop = PathFlags(rawValue: 1 << 1)
        static let rightBottom = PathFlags(rawValue: 1 << 2)
        static let bottom = PathFlags(rawValue: 1 << 3)
        static let leftTop = PathFlags(rawValue: 1 << 4)
        static let leftBottom = PathFlags(rawValue: 1 << 5)
        static let center = PathFlags(rawValue: 1 << 6)
        static let colon = PathFlags(rawValue: 1 << 7)
    }

    let type: DigitType?
    let componentSize: CGSize
    let inset: CGFloat
    let margin: CGFloat
    let color: Color

    var body: some View {
        ZStack {
            let lineWidth = (componentSize.width - inset * 2) / 3
            if type?.paths.contains(.top) ?? false {
                // top
                Path { path in
                    path.move(to: CGPoint(x: (inset + margin), y: inset))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset - margin), y: inset))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth - margin), y: lineWidth))
                    path.addLine(to: CGPoint(x: (lineWidth + margin), y: lineWidth))
                }
                .fill(color)
            }
            if type?.paths.contains(.rightTop) ?? false {
                // rightTop
                Path { path in
                    path.move(to: CGPoint(x: (componentSize.width - lineWidth), y: (lineWidth + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset), y: (inset + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset), y: (componentSize.height / 2 - margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth / 2), y: (componentSize.height / 2 - margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth), y: (componentSize.height / 2 - lineWidth / 2 - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.rightBottom) ?? false {
                // rightBottom
                Path { path in
                    path.move(to: CGPoint(x: (componentSize.width - lineWidth), y: (componentSize.height / 2 + lineWidth / 2 + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth / 2), y: (componentSize.height / 2 + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset), y: (componentSize.height / 2 + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset), y: (componentSize.height - inset - margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth), y: (componentSize.height - lineWidth - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.bottom) ?? false {
                // bottom
                Path { path in
                    path.move(to: CGPoint(x: (lineWidth + margin), y: (componentSize.height - lineWidth)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth - margin), y: (componentSize.height - lineWidth)))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset - margin), y: (componentSize.height - inset)))
                    path.addLine(to: CGPoint(x: (inset + margin), y: (componentSize.height - inset)))
                }
                .fill(color)
            }
            if type?.paths.contains(.leftTop) ?? false {
                // leftTop
                Path { path in
                    path.move(to: CGPoint(x: inset, y: (inset + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (lineWidth + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (componentSize.height / 2 - lineWidth / 2 - margin)))
                    path.addLine(to: CGPoint(x: (lineWidth / 2), y: (componentSize.height / 2 - margin)))
                    path.addLine(to: CGPoint(x: inset, y: (componentSize.height / 2 - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.leftBottom) ?? false {
                // leftBottom
                Path { path in
                    path.move(to: CGPoint(x: inset, y: (componentSize.height / 2 + margin)))
                    path.addLine(to: CGPoint(x: (lineWidth / 2), y: (componentSize.height / 2 + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (componentSize.height / 2 + lineWidth / 2 + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (componentSize.height - lineWidth - margin)))
                    path.addLine(to: CGPoint(x: inset, y: (componentSize.height - inset - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.center) ?? false {
                // center
                Path { path in
                    path.move(to: CGPoint(x: (lineWidth / 2 + margin), y: (componentSize.height / 2)))
                    path.addLine(to: CGPoint(x: (lineWidth + margin), y: (componentSize.height / 2 - lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth - margin), y: (componentSize.height / 2 - lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth / 2 - margin), y: (componentSize.height / 2)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth - margin), y: (componentSize.height / 2 + lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (lineWidth + margin), y: (componentSize.height / 2 + lineWidth / 2)))
                }
                .fill(color)
            }
            if type?.paths.contains(.colon) ?? false {
                // colon
                Path { path in
                    path.addArc(
                        center: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (componentSize.height / 4)),
                        radius: (lineWidth / 2),
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: false
                    )
                    path.closeSubpath()
                }
                Path { path in
                    path.addArc(
                        center: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (componentSize.height / 4 * 3)),
                        radius: (lineWidth / 2),
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: false
                    )
                    path.closeSubpath()
                }
            }
        }
        .frame(width: componentSize.width, height: componentSize.height)
    }
}

#Preview {
    VStack {
        HStack {
            DigitView(value: 0, componentSize: defaultComponentSize)
            DigitView(value: 1, componentSize: defaultComponentSize)
            DigitView(value: 2, componentSize: defaultComponentSize)
            DigitView(value: 3, componentSize: defaultComponentSize)
            DigitView(value: 4, componentSize: defaultComponentSize)
        }
        HStack {
            DigitView(value: 5, componentSize: defaultComponentSize)
            DigitView(value: 6, componentSize: defaultComponentSize)
            DigitView(value: 7, componentSize: defaultComponentSize)
            DigitView(value: 8, componentSize: defaultComponentSize)
            DigitView(value: 9, componentSize: defaultComponentSize)
        }
        HStack {
            DigitView(value: 10, componentSize: defaultComponentSize)
            DigitView(value: 11, componentSize: defaultComponentSize)
            DigitView(value: 12, componentSize: defaultComponentSize)
        }
    }
}
