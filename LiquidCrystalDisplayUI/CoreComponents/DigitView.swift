//
//  DigitView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/05.
//

import SwiftUI

struct DigitView: View {
    let value: Int

    var body: some View {
        ZStack {
            DigitContentView(type: .init(rawValue: value), width: 18, height: 30, inset: 1, margin: 1, color: Color.black)
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
    }

    let type: DigitType?
    let width: CGFloat
    let height: CGFloat
    let inset: CGFloat
    let margin: CGFloat
    let color: Color

    var body: some View {
        ZStack {
            let lineWidth = (width - inset * 2) / 4
            if type?.paths.contains(.top) ?? false {
                // topPath
                Path { path in
                    path.move(to: CGPoint(x: (inset + margin), y: inset))
                    path.addLine(to: CGPoint(x: (width - inset - margin), y: inset))
                    path.addLine(to: CGPoint(x: (width - lineWidth - margin), y: lineWidth))
                    path.addLine(to: CGPoint(x: (lineWidth + margin), y: lineWidth))
                }
                .fill(color)
            }
            if type?.paths.contains(.rightTop) ?? false {
                // rightTopPath
                Path { path in
                    path.move(to: CGPoint(x: (width - lineWidth), y: (lineWidth + margin)))
                    path.addLine(to: CGPoint(x: (width - inset), y: (inset + margin)))
                    path.addLine(to: CGPoint(x: (width - inset), y: (height / 2 - margin)))
                    path.addLine(to: CGPoint(x: (width - lineWidth / 2), y: (height / 2 - margin)))
                    path.addLine(to: CGPoint(x: (width - lineWidth), y: (height / 2 - lineWidth / 2 - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.rightBottom) ?? false {
                // rightBottomPath
                Path { path in
                    path.move(to: CGPoint(x: (width - lineWidth), y: (height / 2 + lineWidth / 2 + margin)))
                    path.addLine(to: CGPoint(x: (width - lineWidth / 2), y: (height / 2 + margin)))
                    path.addLine(to: CGPoint(x: (width - inset), y: (height / 2 + margin)))
                    path.addLine(to: CGPoint(x: (width - inset), y: (height - inset - margin)))
                    path.addLine(to: CGPoint(x: (width - lineWidth), y: (height - lineWidth - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.bottom) ?? false {
                // bottomPath
                Path { path in
                    path.move(to: CGPoint(x: (lineWidth + margin), y: (height - lineWidth)))
                    path.addLine(to: CGPoint(x: (width - lineWidth - margin), y: (height - lineWidth)))
                    path.addLine(to: CGPoint(x: (width - inset - margin), y: (height - inset)))
                    path.addLine(to: CGPoint(x: (inset + margin), y: (height - inset)))
                }
                .fill(color)
            }
            if type?.paths.contains(.leftTop) ?? false {
                // leftTopPath
                Path { path in
                    path.move(to: CGPoint(x: inset, y: (inset + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (lineWidth + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (height / 2 - lineWidth / 2 - margin)))
                    path.addLine(to: CGPoint(x: (lineWidth / 2), y: (height / 2 - margin)))
                    path.addLine(to: CGPoint(x: inset, y: (height / 2 - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.leftBottom) ?? false {
                // leftBottomPath
                Path { path in
                    path.move(to: CGPoint(x: inset, y: (height / 2 + margin)))
                    path.addLine(to: CGPoint(x: (lineWidth / 2), y: (height / 2 + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (height / 2 + lineWidth / 2 + margin)))
                    path.addLine(to: CGPoint(x: lineWidth, y: (height - lineWidth - margin)))
                    path.addLine(to: CGPoint(x: inset, y: (height - inset - margin)))
                }
                .fill(color)
            }
            if type?.paths.contains(.center) ?? false {
                // centerPath
                Path { path in
                    path.move(to: CGPoint(x: (lineWidth / 2 + margin), y: (height / 2)))
                    path.addLine(to: CGPoint(x: (lineWidth + margin), y: (height / 2 - lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (width - lineWidth - margin), y: (height / 2 - lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (width - lineWidth / 2 - margin), y: (height / 2)))
                    path.addLine(to: CGPoint(x: (width - lineWidth - margin), y: (height / 2 + lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (lineWidth + margin), y: (height / 2 + lineWidth / 2)))
                }
                .fill(color)
            }
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    VStack {
        HStack {
            DigitView(value: 0)
            DigitView(value: 1)
            DigitView(value: 2)
            DigitView(value: 3)
            DigitView(value: 4)
        }
        HStack {
            DigitView(value: 5)
            DigitView(value: 6)
            DigitView(value: 7)
            DigitView(value: 8)
            DigitView(value: 9)
        }
    }
}
