//
//  TimeView.swift
//  LiquidCrystalDisplayUI
//
//  Created by Atsushi Jike on 2023/09/03.
//

import SwiftUI

struct TimeView: View {
    let componentSize: CGSize?
    @State var hour: Int = 0
    @State var minute: Int = 0
    @State var second: Int = 0
    @State var miliSecond: Int = 0
    let timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()

    var body: some View {
        HStack {
            NumberView(value: hour, numberOfDigits: nil, componentSize: componentSize ?? defaultComponentSize)
            DividerView(dividerType: .colon, componentSize: nil)
            NumberView(value: minute, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
            DividerView(dividerType: .space, componentSize: nil)
            NumberView(value: second, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
            DividerView(dividerType: .period, componentSize: nil)
            NumberView(value: miliSecond, numberOfDigits: 2, componentSize: componentSize ?? defaultComponentSize)
        }.onReceive(timer){ _ in
            self.hour = Calendar.current.component(.hour, from: Date())
            self.minute = Calendar.current.component(.minute, from: Date())
            self.second = Calendar.current.component(.second, from: Date())
            self.miliSecond = Calendar.current.component(.nanosecond, from: Date()) / 10000000
        }
    }
}

#Preview {
    TimeView(componentSize: nil,
             hour: 1,
             minute: 23,
             second: 45,
             miliSecond: 67)
}
