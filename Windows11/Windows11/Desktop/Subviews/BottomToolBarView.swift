//
//  BottomToolBarView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct BottomToolBarView: View {
    
    @State var isDesktop: Bool
    
    var body: some View {
        ZStack {
            VStack {
                if isDesktop {
                    BottomShortcutView()
                }
            }
            HStack {
                Spacer()
                StatusBarView(isDesktop: isDesktop)
            }
        }
        .frame(height: Const.bottomStatusHeight)
        .background(background).opacity(0.85)
    }
    
    var background: Color {
        isDesktop ? Color.textWhite: Color.clear
    }
}

struct BottomToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolBarView(isDesktop: true)
    }
}
