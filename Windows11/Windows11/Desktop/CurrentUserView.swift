//
//  CurrentUserView.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

struct CurrentUserView: View {
    
    @EnvironmentObject var windowObject: WindowStatusObject
    @EnvironmentObject var desktopObject: DesktopObject
    @Environment(\.openURL) var openURL
    
    let maxHeight: CGFloat = 60.0
    
    var body: some View {
        VStack {
            Spacer()
            HStack() {
                Button {
                    print("avatar.")
                    openURL(URL(string: Const.repoURL)!)
                } label: {
                    HStack {
                        Image("jinxiansen").resizable().frame(width: 35.0, height: 35.0).clipShape(Circle()).padding(.leading, 60.0)
                        Text("Jinxiansen").font(.headline).foregroundColor(Color.darkTitle)
                    }.frame(height: maxHeight)
                }.buttonStyle(PlainButtonStyle())
                Spacer()
                Button {
                   print("Shutdown.")
                    desktopObject.resetAllStates()
                    windowObject.status = .launch
                } label: {
                    Image("power")
                        .resizable().renderingMode(.template)
                        .foregroundColor(Color.darkTitle)
                        .frame(width: 20.0, height: 20.0)
                        .padding(.trailing, 60.0)
                }.buttonStyle(PlainButtonStyle())
            }.background(Color.launchpad)
        }
        .frame(height: maxHeight)
    }
}

struct CurrentUserView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView()
    }
}
