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
