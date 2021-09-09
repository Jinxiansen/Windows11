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
        ZStack {
            BackgroundView()
                .onTapGesture {
                    desktopObject.statusType = nil
                    desktopObject.shortcutType = nil
                    print("Click background.")
                    
                }.contextMenu {
                    DoubleClickView()
                }
            AboutWindowsView()
            renderStatusViewIfNeed()
            renderShortcutViewIfNeed()
            
            VStack {
                HStack {
                    LeadingShortcutView()
                    Spacer()
                }
                Spacer()
                BottomToolBar(isDesktop: true)
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
