//
//  SettingsView.swift
//  Windows11
//
//  Created by 晋先森 on 9/11/21.
//

import SwiftUI

enum SettingsConst {
    static let maxWidth: CGFloat = 1000.0
}

struct SettingsView: View {
    
    @EnvironmentObject private var desktopObject: DesktopObject
    
    @State var scale: CGFloat = 0.75
    @State private var leadingTypes = SettingType.allCases
    @State private var systemTypes = SystemMenuType.allCases
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            contentView
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 0.15)) {
                        scale = 1.0
                    }
                }
        }
        .frame(width: SettingsConst.maxWidth)
    }
    
    private var contentView: some View {
        VStack {
            topBarView
            Divider()
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    loginUser.padding(15.0)
                    ForEach(leadingTypes, id: \.self) { type in
                        HStack {
                            Image(type.imageName).resizable().frame(width: 18, height: 18).padding(.leading, 5.0)
                            Text(type.title).foregroundColor(Color.darkTitle)
                            Spacer()
                        }
                        .frame(width: SettingsConst.maxWidth/3,height: 40.0)
                        .onHoverBackground()
                    }
                    .padding(.leading, 15.0)
                }
                detailView
            }
        }.background(Color.launchpad)
    }
    
    private var topBarView: some View {
        HStack {
            HStack {
                Button {
                    print("Back.")
                    desktopObject.shortcutType = .launchpad
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
         
                generateButton(iconName: "minus") {
                    print("--minus--")
                }
                generateButton(iconName: "square") {
                    print("--square---")
                }
                generateButton(iconName: "xmark") {
                    print("--xmark---")
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
                Image(systemName: iconName).resizable().frame(width: 14, height: 14)
            }.buttonStyle(PlainButtonStyle())
            .padding(3.0)
        }
        .onHoverBackground()
    }
    
    private var loginUser: some View {
        HStack {
            Image("jinxiansen")
                .resizable()
                .frame(width: 60, height: 60.0)
                .clipShape(Circle())
                .shadow(radius: 2.0)
                .overlay(Circle().stroke(Color.black.opacity(0.3), lineWidth: 1.0))
            VStack(alignment: .leading, spacing: 0) {
                Text("Jinxiansen")
                    .bold()
                    .font(.title3)
                    .padding([.horizontal], 3.0)
                    .foregroundColor(Color.darkTitle)
                Link(Const.email, destination: URL(string: Const.contactMe)!)
                    .foregroundColor(Color.darkTitle)
                    .padding([.horizontal], 3.0)
                    .onHoverBackground()
            }
        }
    }
    
    var detailView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(SettingType.system.title).bold().font(.system(size: 40)).padding(.leading, 20.0)
            SystemStatusView()
            ScrollView {
                ForEach(systemTypes, id: \.self) { type in
                    HStack(alignment: .center) {
                        Image(type.imageName).renderingMode(.template).resizable().frame(width: 18, height: 18).padding(.leading, 15.0)
                        VStack(alignment: .leading, spacing: 0) {
                            Text(type.info.title).font(.title2)
                            Text(type.info.subTitle)
                        }.padding(.top, 10.0)
                        Spacer()
                        Image(systemName: "chevron.right").padding(.trailing, 15.0)
                    }
                    .frame(height: 50.0)
                    .onHoverBackground()
                }
                .padding(.leading, 10.0)
            }.frame(maxHeight: 400.0)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
