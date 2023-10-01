//
//  DigitView.swift
//  MonochromeKit
//
//  Created by Atsushi Jike on 2023/09/05.
//

import SwiftUI

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
    case hyphn
    case space
    case a
    case e
    case f
    case h
    case m
    case o
    case r
    case s
    case t
    case u
    case w

    var paths: PathFlags {
        switch self {
        case .zero:
            return [.top, .rightTop, .rightBottom, .bottom, .leftTop, .leftBottom]
        case .one:
            return [.rightTop, .rightBottom]
        case .two:
            return [.top, .rightTop, .middle, .leftBottom, .bottom]
        case .three:
            return [.top, .rightTop, .rightBottom, .middle, .bottom]
        case .four:
            return [.leftTop, .rightTop, .middle, .rightBottom]
        case .five:
            return [.top, .leftTop, .middle, .rightBottom, .bottom]
        case .six:
            return [.top, .leftTop, .leftBottom, .middle, .rightBottom, .bottom]
        case .seven:
            return [.top, .rightTop, .rightBottom]
        case .eight:
            return [.top, .leftTop, .leftBottom, .middle, .rightTop, .rightBottom, .bottom]
        case .nine:
            return [.top, .leftTop, .middle, .rightTop, .rightBottom, .bottom]
        case .hyphn:
            return [.middle]
        case .space:
            return []
        case .a:
            return [.top, .leftTop, .leftBottom, .middle, .rightTop, .rightBottom]
        case .e:
            return [.top, .leftTop, .leftBottom, .middle, .bottom]
        case .f:
            return [.top, .leftTop, .leftBottom, .middle]
        case .h:
            return [.leftTop, .leftBottom, .middle, .rightTop, .rightBottom]
        case .m:
            return [.top, .leftTop, .leftBottom, .center, .rightTop, .rightBottom]
        case .o:
            return [.top, .leftTop, .leftBottom, .rightTop, .rightBottom, .bottom]
        case .r:
            return [.top, .leftTop, .leftBottom, .middle, .rightTop, .rightBottom]
        case .s:
            return [.top, .leftTop, .middle, .rightBottom, .bottom]
        case .t:
            return [.top, .center]
        case .u:
            return [.leftTop, .leftBottom, .rightTop, .rightBottom, .bottom]
        case .w:
            return [.leftTop, .leftBottom, .center, .rightTop, .rightBottom, .bottom]
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
    static let middle = PathFlags(rawValue: 1 << 6)
    static let center = PathFlags(rawValue: 1 << 7)
}

struct DigitView: View {
    let type: DigitType
    let componentSize: CGSize

    var body: some View {
        ZStack {
            DigitContentView(type: type, componentSize: componentSize, inset: 1, margin: 1, color: Color.black)
        }
    }
}

private struct DigitContentView: View {
    let type: DigitType
    let componentSize: CGSize
    let inset: CGFloat
    let margin: CGFloat
    let color: Color

    var body: some View {
        ZStack {
            let lineWidth = (componentSize.width - inset * 2) / 3.5
            if type.paths.contains(.top) {
                // top
                Path { path in
                    path.move(to: CGPoint(x: (inset + margin), y: inset))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset - margin), y: inset))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth - margin), y: lineWidth))
                    path.addLine(to: CGPoint(x: (lineWidth + margin), y: lineWidth))
                }
                .fill(color)
            }
            if type.paths.contains(.rightTop) {
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
            if type.paths.contains(.rightBottom) {
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
            if type.paths.contains(.bottom) {
                // bottom
                Path { path in
                    path.move(to: CGPoint(x: (lineWidth + margin), y: (componentSize.height - lineWidth)))
                    path.addLine(to: CGPoint(x: (componentSize.width - lineWidth - margin), y: (componentSize.height - lineWidth)))
                    path.addLine(to: CGPoint(x: (componentSize.width - inset - margin), y: (componentSize.height - inset)))
                    path.addLine(to: CGPoint(x: (inset + margin), y: (componentSize.height - inset)))
                }
                .fill(color)
            }
            if type.paths.contains(.leftTop) {
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
            if type.paths.contains(.leftBottom) {
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
            if type.paths.contains(.middle) {
                // middle
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
            if type.paths.contains(.center) {
                // center
                Path { path in
                    path.move(to: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (lineWidth + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 + lineWidth / 2), y: (lineWidth + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 + lineWidth / 2), y: (componentSize.height / 2 - lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (componentSize.height / 2 - lineWidth / 2)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (lineWidth + margin)))
                    
                }
                .fill(color)
                Path { path in
                    path.move(to: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (componentSize.height / 2 + lineWidth / 2 + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 + lineWidth / 2), y: (componentSize.height / 2 + lineWidth / 2 + margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 + lineWidth / 2), y: (componentSize.height - lineWidth - margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (componentSize.height - lineWidth - margin)))
                    path.addLine(to: CGPoint(x: (componentSize.width / 2 - lineWidth / 2), y: (componentSize.height / 2 + lineWidth / 2 + margin)))
                    
                }
                .fill(color)
            }
        }
        .frame(width: componentSize.width, height: componentSize.height)
    }
}

#Preview {
    VStack {
        HStack {
            DigitView(type: .zero, componentSize: defaultComponentSize)
            DigitView(type: .one, componentSize: defaultComponentSize)
            DigitView(type: .two, componentSize: defaultComponentSize)
            DigitView(type: .three, componentSize: defaultComponentSize)
            DigitView(type: .four, componentSize: defaultComponentSize)
        }
        HStack {
            DigitView(type: .five, componentSize: defaultComponentSize)
            DigitView(type: .six, componentSize: defaultComponentSize)
            DigitView(type: .seven, componentSize: defaultComponentSize)
            DigitView(type: .eight, componentSize: defaultComponentSize)
            DigitView(type: .nine, componentSize: defaultComponentSize)
        }
        HStack {
            DigitView(type: .hyphn, componentSize: defaultComponentSize)
            DigitView(type: .space, componentSize: defaultComponentSize)
        }
        HStack {
            DigitView(type: .a, componentSize: defaultComponentSize)
            DigitView(type: .e, componentSize: defaultComponentSize)
            DigitView(type: .f, componentSize: defaultComponentSize)
            DigitView(type: .h, componentSize: defaultComponentSize)
            DigitView(type: .m, componentSize: defaultComponentSize)
        }
        HStack {
            DigitView(type: .o, componentSize: defaultComponentSize)
            DigitView(type: .r, componentSize: defaultComponentSize)
            DigitView(type: .s, componentSize: defaultComponentSize)
            DigitView(type: .t, componentSize: defaultComponentSize)
            DigitView(type: .u, componentSize: defaultComponentSize)
            DigitView(type: .w, componentSize: defaultComponentSize)
        }
    }
}
