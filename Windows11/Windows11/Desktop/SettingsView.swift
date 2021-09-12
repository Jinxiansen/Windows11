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
        
    @State private var scale: CGFloat = 0.85
    @State private var leadingTypes = SettingType.allCases
    @State private var systemTypes = SystemMenuType.allCases
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            contentView
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation.easeIn(duration: 0.15)) {
                        scale = 1.0
                    }
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 2, y: 0)
        .frame(width: SettingsConst.maxWidth)
    }
    
    private var contentView: some View {
        VStack {
            TopBarView()
            Divider()
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    LoginUserView().padding(15.0)
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
