//
//  SystemDetailView.swift
//  Windows11
//
//  Created by 晋先森 on 9/12/21.
//

import SwiftUI

struct SystemDetailView: View {
    @State private var systemTypes = SystemMenuType.allCases
    
    var body: some View {
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

struct SystemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SystemDetailView()
    }
}
