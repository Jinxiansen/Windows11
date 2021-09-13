//
//  BackgroundView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        GeometryReader{ proxy in
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
