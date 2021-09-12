//
//  SettingsView.swift
//  Windows11
//
//  Created by 晋先森 on 9/11/21.
//

import SwiftUI

enum SettingsConst {
    static let maxWidth: CGFloat = 1000.0
}

struct SettingsView: View {
        
    @State private var scale: CGFloat = 0.85
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            contentView
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation.easeIn(duration: 0.15)) {
                        scale = 1.0
                    }
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 2, y: 0)
        .frame(width: SettingsConst.maxWidth)
    }
    
    private var contentView: some View {
        VStack {
            TopBarView()
            Divider()
            HStack(alignment: .top, spacing: 10) {
                SystemListView()
                SystemDetailView()
            }
        }.background(Color.launchpad)
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
