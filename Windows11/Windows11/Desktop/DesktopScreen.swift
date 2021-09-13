//
//  DesktopScreen.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct DesktopScreen: View {
    @State private var scale: CGFloat = 1.05
    @EnvironmentObject private var desktopObject: DesktopObject
    
    var body: some View {
        ZStack {
            BackgroundView()
                .onTapGesture {
                    desktopObject.resetAllStates()
                    print("Click background.")
                    
                }.contextMenu {
                    RightClickView()
                }
            VStack {
                HStack {
                    LeadingShortcutView()
                    Spacer()
                }
                Spacer()
            }
            
            AboutWindowsView()
            renderShortcutViewIfNeed()
            renderStatusViewIfNeed()
            
            VStack {
                Spacer()
                BottomToolBar(isDesktop: true)
            }
        }.scaleEffect(scale)
        .onAppear {
            withAnimation(Animation.easeIn(duration: 0.2)) {
                scale = 1.0
            }
        }
    }
    
    @ViewBuilder
    func renderStatusViewIfNeed() -> some View {
        switch desktopObject.statusType {
        case .notification: NotificationsView()
        case .time: CalendarView(calendar: Calendar(identifier: .republicOfChina))
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func renderShortcutViewIfNeed() -> some View {
        switch desktopObject.shortcutType {
        case .launchpad: LaunchpadView()
        case .settings: SettingsView()
        default:
            EmptyView()
        }
    }
}

struct DesktopScreen_Previews: PreviewProvider {
    static var previews: some View {
        DesktopScreen()
    }
}
