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
    
    @State private var offset: CGFloat = LaunchpadConst.maxWidth/2
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                VStack {
                    SearchBar()
                    PinnedView()
                    RecommendedView()
                }.padding(.top, 30.0)
                CurrentUserView()
            }.background(Color.launchpad.opacity(0.95))
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
            .shadow(color: .clear, radius: 0, x: 0, y: 0)
        }
        .frame(width: LaunchpadConst.maxWidth)
        .offset(x: 0, y: offset)
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 1)) {
                self.offset = -(Const.bottomStatusHeight + 15.0)
            }
        }
    }
}

struct LaunchpadView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchpadView()
    }
}
