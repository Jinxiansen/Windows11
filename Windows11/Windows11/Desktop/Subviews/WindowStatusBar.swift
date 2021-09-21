//
//  WindowStatusBar.swift
//  Windows11
//
//  Created by 晋先森 on 9/20/21.
//

import SwiftUI

enum WindowStatusType {
    case minimize
    case maximize
    case close
}

struct WindowStatusBar: View {
    @State var tintColor: Color
    var clickClosure: ((WindowStatusType) -> ())?

    var body: some View {
        HStack {
            generateButton(iconName: "minimize") {
                print("--minimize--")
                clickClosure?(.minimize)
            }
            generateButton(iconName: "maximize") {
                print("--maximize---")
                clickClosure?(.maximize)
            }
            generateButton(iconName: "close") {
                print("--close---")
                clickClosure?(.close)
            }
        }
    }
    
    private func generateButton(iconName: String,
                                tapClosure: @escaping (() -> Void)) -> some View {
        HStack {
            Button {
                tapClosure()
            } label: {
                Image(iconName).resizable()
                    .renderingMode(.template)
                    .foregroundColor(tintColor)
                    .frame(width: 14, height: 14)
            }.buttonStyle(PlainButtonStyle())
            .padding(3.0)
        }
        .onHoverBackground()
    }
}

struct WindowStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        WindowStatusBar(tintColor: Color.red)
    }
}
