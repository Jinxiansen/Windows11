//
//  DesktopView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct DesktopView: View {
    
    @State private var selectedType: StatusBarMenuType?
    @State private var offset:Float = 0
    
    var body: some View {
        BackgroundView()
            .onTapGesture {
                selectedType = nil
                print("Click background.")
            }
        VStack {
            HStack {
                AppMenuView()
                Spacer()
            }
            Spacer()
            BottomToolBarView(isDesktop: true, selectedType: $selectedType)
        }
        VStack {
            HStack {
                AboutWindowsView().padding(EdgeInsets(top: 50.0, leading: 120.0, bottom: 0, trailing: 0))
                Spacer()
            }
            Spacer()
        }
        if selectedType == .notification {
            HStack {
                Spacer()
                NotificationsView().padding(EdgeInsets(top: 0.1, leading: 0, bottom: Const.bottomStatusHeight + 0.1, trailing: 0.1))
            }.shadow(color: .black.opacity(0.35), radius: 3, x: -1, y: 0)
        } else if selectedType == .time {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ContentContentView(calendar: Calendar(identifier: .republicOfChina))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 60.0, trailing: 10.0))
                }
            }.shadow(color: .black.opacity(0.35), radius: 3, x: -1, y: 0)
        }
        
    }
}

struct DesktopView_Previews: PreviewProvider {
    static var previews: some View {
        DesktopView()
    }
}
