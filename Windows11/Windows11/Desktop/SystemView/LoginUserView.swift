//
//  LoginUserView.swift
//  Windows11
//
//  Created by 晋先森 on 9/12/21.
//

import SwiftUI

struct LoginUserView: View {
    var body: some View {
        HStack {
            Image("jinxiansen")
                .resizable()
                .frame(width: 60, height: 60.0)
                .clipShape(Circle())
                .shadow(radius: 2.0)
                .overlay(Circle().stroke(Color.black.opacity(0.3), lineWidth: 1.0))
            VStack(alignment: .leading, spacing: 0) {
                Text(Const.userName)
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
}

struct LoginUserView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUserView()
    }
}
