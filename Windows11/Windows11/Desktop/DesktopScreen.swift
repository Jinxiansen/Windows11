//
//  DesktopScreen.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct DesktopScreen: View {
    
    @State private var scale: CGFloat = 1.05
    @EnvironmentObject var desktopObject: DesktopObject
    
    var body: some View {
        ZStack {
            BackgroundView()
                .onTapGesture {
                    desktopObject.resetAllStates()
                    print("Click background.")
                    
                }.contextMenu {
                    DoubleClickView()
                }
            VStack {
                HStack() {
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
    
    func renderStatusViewIfNeed() -> AnyView {
        switch desktopObject.statusType {
        case .notification: return NotificationsView().toAny()
        case .time: return CalendarView(calendar: Calendar(identifier: .republicOfChina)).toAny()
        default:
            return EmptyView().toAny()
        }
    }
    
    func renderShortcutViewIfNeed() -> AnyView {
        switch desktopObject.shortcutType {
        case .launchpad: return LaunchpadView().toAny()
        case .settings: return SettingsView().toAny()
        default:
            return EmptyView().toAny()
        }
    }
    
}

struct DesktopScreen_Previews: PreviewProvider {
    static var previews: some View {
        DesktopScreen()
    }
}
