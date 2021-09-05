//
//  DesktopScreen.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct DesktopScreen: View {
        
    @State private var offset:Float = 0
    @EnvironmentObject var desktopObject: DesktopObject

    var body: some View {
        BackgroundView()
            .onTapGesture {
                desktopObject.statusType = nil
                print("Click background.")
                
            }.contextMenu {
                DoubleClickView()
            }
        VStack {
            HStack {
                LeadingShortcutView()
                Spacer()
            }
            Spacer()
            BottomToolBarView(isDesktop: true)
        }
        VStack {
            HStack {
                AboutWindowsView().padding(EdgeInsets(top: 50.0, leading: 120.0, bottom: 0, trailing: 0))
                Spacer()
            }
            Spacer()
        }
        if desktopObject.statusType == .notification {
            HStack {
                Spacer()
                NotificationsView().padding(EdgeInsets(top: 0.1, leading: 0, bottom: Const.bottomStatusHeight + 2, trailing: 0.1))
            }.shadow(color: .black.opacity(0.35), radius: 3, x: -1, y: 0)
        } else if desktopObject.statusType == .time {
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

struct DesktopScreen_Previews: PreviewProvider {
    static var previews: some View {
        DesktopScreen()
    }
}
