//
//  LaunchpadView.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

enum LaunchpadConst {
    static let maxWidth: CGFloat = 550.0
    static let margin: CGFloat = 30.0
    
}

struct LaunchpadView: View {
    
    @State private var offset: CGFloat = -75.0
    
    var body: some View {
        VStack {
            VStack {
                SearchBar()
                PinnedView()
                RecommendedView()
            }.padding(.top, 30.0)
            CurrentUserView().frame(height: 60.0).background(Color.main)
        }.background(Color.textWhite)
        .frame(width: LaunchpadConst.maxWidth)
        .offset(x: 0, y: offset)
        .shadow(color: .clear, radius: 0, x: 0, y: 0)
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
        .onAppear {
            withAnimation(.easeInOut) {
                self.offset = 0
            }
        }
    }
}

struct LaunchpadView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchpadView()
    }
}
