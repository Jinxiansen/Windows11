//
//  DesktopView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct DesktopView: View {
    var body: some View {
        BackgroundView()
        VStack {
            HStack {
                AboutWindowsView().padding(EdgeInsets(top: 50.0, leading: 120.0, bottom: 0, trailing: 0))
                Spacer()
            }
            Spacer()
        }
        VStack {
            HStack {
                AppMenuView()
                Spacer()
            }
            Spacer()
            BottomToolBarView(isDesktop: true)
        }
        
    }
}

struct DesktopView_Previews: PreviewProvider {
    static var previews: some View {
        DesktopView()
    }
}
