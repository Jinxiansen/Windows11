//
//  TopBarView.swift
//  Windows11
//
//  Created by 晋先森 on 9/12/21.
//

import SwiftUI

struct TopBarView: View {
    @EnvironmentObject private var desktopObject: DesktopObject
    
    var body: some View {
        HStack {
            HStack {
                Button {
                    print("Back.")
//                    desktopObject.shortcutType = .launchpad
                    desktopObject.resetAllStates()
                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 15, height: 15)
                        .padding(3.0)
                        .onHoverBackground()
                }.buttonStyle(PlainButtonStyle())
                .padding(.leading, 15.0)
                
                Text("Settings").padding(.leading, 10.0)
                Spacer()
                
                generateButton(iconName: "minimize") {
                    print("--minimize--")
                }
                generateButton(iconName: "maximize") {
                    print("--maximize---")
                }
                generateButton(iconName: "close") {
                    print("--close---")
                    if desktopObject.shortcutType == .settings {
                        desktopObject.shortcutType = nil
                    }
                }
                
            }.padding(.init(top: 10.0, leading: 10.0, bottom: 5.0, trailing: 10.0))
        }
    }
    
    private func generateButton(iconName: String,
                                tapClosure: @escaping (() -> ())) -> some View {
        HStack {
            Button {
                tapClosure()
            } label: {
                Image(iconName).resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.darkSubTitle)
                    .frame(width: 14, height: 14)
            }.buttonStyle(PlainButtonStyle())
            .padding(3.0)
        }
        .onHoverBackground()
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
