//
//  SystemStatusView.swift
//  Windows11
//
//  Created by 晋先森 on 9/11/21.
//

import SwiftUI

struct SystemStatusView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 15.0) {
            Image("background")
                .resizable()
                .frame(width: 134.4, height: 84.0)
                .shadow(radius: 2.0)
                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                .padding(.leading, 15.0)
            VStack(alignment: .leading, spacing: 2.0) {
                Text("SC-2021109112142").foregroundColor(Color.darkTitle).bold().font(.title3)
                Text("B450M GAMING").foregroundColor(Color.darkTitle)
                Button {
                    print("Rename.")
                } label: {
                    Text("Rename").foregroundColor(Color.yellow.opacity(0.85))
                }.buttonStyle(PlainButtonStyle())
                .onHoverBackground()
                
            }.padding(.top, 10.0)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack() {
                    systemStatusView(imageName: "store2", title: "Microsoft 365", subTitle: "View benefits")
                    systemStatusView(imageName: "oneDrive", title: "OneDrive", subTitle: "Manage")
                }
                systemStatusView(imageName: "board", title: "Windows Update", subTitle: "Last checked: 1 hour ago")
            }
        }
    }
    
    private func systemStatusView(imageName: String,
                                  title: String,
                                  subTitle: String) -> some View {
        HStack(alignment: .top, spacing: 0) {
            Image(imageName).resizable().frame(width: 25.0, height: 25.0)
            VStack(alignment: .leading, spacing: 0) {
                Text(title).font(.title3)
                Text(subTitle).foregroundColor(Color.darkSubTitle).font(.caption2)
            }.padding(.leading, 10.0)
        }.padding(3.0)
        .onHoverBackground()
    }
}

struct SystemStatusView_Previews: PreviewProvider {
    static var previews: some View {
        SystemStatusView()
    }
}
