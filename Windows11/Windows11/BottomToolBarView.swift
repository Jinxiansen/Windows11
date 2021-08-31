//
//  BottomToolBarView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct BottomToolBarView: View {
    var body: some View {
        
        ZStack {
            VStack {
                ShortcutMenuView()
            }
            HStack {
                Spacer()
                StatusBarView()
            }
        }
        .frame(height: 40.0)
        .background(Color.white).opacity(0.85)
    }
}

struct BottomToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolBarView()
    }
}
