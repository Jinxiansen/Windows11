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
                WindowStatusBar(tintColor: Color.lightTitle) {
                    self.statusBarClick(type: $0)
                }
                
            }.padding(.init(top: 10.0, leading: 10.0, bottom: 5.0, trailing: 10.0))
        }
    }
    
    func statusBarClick(type: WindowStatusType) {
        switch type {
        case .maximize:
            break
        default:
            desktopObject.shortcutType = nil
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
