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
                    ShortcutMenuView()
                }
            }
            HStack {
                Spacer()
                StatusBarView(isDesktop: isDesktop)
            }
        }
        .frame(height: 50.0)
        .background(isDesktop ? Color.white: Color.clear).opacity(0.85)
    }
}

struct BottomToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolBarView(isDesktop: true)
    }
}
