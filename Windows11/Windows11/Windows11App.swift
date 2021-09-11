//
//  Windows11App.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

@main
struct Windows11App: App {
    
    @StateObject var windowObject = WindowStatusObject(status: .desktop)
    @StateObject var store = PreferencesStore.shared
    
    @StateObject var desktopObject = DesktopObject()

    var body: some Scene {
        WindowGroup {
            ZStack {
                contentView
            }
            .environmentObject(windowObject)
            .environmentObject(desktopObject)
            .preferredColorScheme(store.colorScheme.colorScheme)
            .frame(minWidth: 1280.0, idealWidth: 2560, maxWidth: 3840, minHeight: 800.0, idealHeight: 1600.0, maxHeight: 2400.0, alignment: .center)
        }.commands {
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                AboutApp()
            }
        }
    }
    
    var contentView: AnyView {
        switch windowObject.status {
        case .launch: return AnyView(LaunchScreen())
        case .lockScreen: return AnyView(LockScreen())
        case .login: return AnyView(LoginScreen())
        case .desktop: return AnyView(DesktopScreen())
        }
    }
}
