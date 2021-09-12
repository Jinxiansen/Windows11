//
//  BottomToolBar.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct BottomToolBar: View {
    
    @State var isDesktop: Bool
    
    var body: some View {
        ZStack {
            VStack {
                BottomShortcutBar().isShow(isDesktop)
            }
            HStack {
                Spacer()
                BottomStatusBar(isDesktop: isDesktop)
            }
        }
        .frame(height: Const.bottomStatusHeight)
        .background(background).opacity(0.95)
    }
    
    var background: Color {
        isDesktop ? Color.launchpad: Color.clear
    }
}

struct BottomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolBar(isDesktop: true)
    }
}
