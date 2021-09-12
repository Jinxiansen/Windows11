//
//  SystemListView.swift
//  Windows11
//
//  Created by 晋先森 on 9/12/21.
//

import SwiftUI

struct SystemListView: View {
    @State private var types = SettingType.allCases

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            LoginUserView().padding(15.0)
            ForEach(types, id: \.self) { type in
                SystemListCell(type: type)
            }
            .padding(.leading, 15.0)
        }
    }
}

private struct SystemListCell: View {
    let type: SettingType

    var body: some View {
        HStack {
            Image(type.imageName).resizable().frame(width: 18, height: 18).padding(.leading, 5.0)
            Text(type.title).foregroundColor(Color.darkTitle)
            Spacer()
        }
        .frame(width: SettingsConst.maxWidth / 3, height: 40.0)
        .onHoverBackground()
    }
}

struct SystemListView_Previews: PreviewProvider {
    static var previews: some View {
        SystemListView()
    }
}
