//
//  CurrentUserView.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

struct CurrentUserView: View {
    var body: some View {
        HStack() {
            Button {
                print("avatar.")
            } label: {
                HStack {
                    Image("jinxiansen").resizable().frame(width: 35.0, height: 35.0).clipShape(Circle()).padding(.leading, 60.0)
                    Text("Jinxiansen").font(.headline).foregroundColor(Color.white)
                }
            }.buttonStyle(PlainButtonStyle())
            Spacer()
            Button {
               print("Shutdown.")
            } label: {
                Image("power")
                    .resizable().renderingMode(.template)
                    .foregroundColor(Color.white)
                    .frame(width: 20.0, height: 20.0)
                    .padding(.trailing, 60.0)
            }.buttonStyle(PlainButtonStyle())

        }
    }
}

struct CurrentUserView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView()
    }
}
