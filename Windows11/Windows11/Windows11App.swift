//
//  Windows11App.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

@main
struct Windows11App: App {
    @StateObject var windowObject = WindowStatusObject(status: .launch)
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
            .frame(minWidth: 1280.0, minHeight: 800.0, alignment: .center)
        }.commands {
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                AboutApp()
            }
        }
    }

    @ViewBuilder
    var contentView: some View {
        switch windowObject.status {
        case .launch: LaunchScreen()
        case .lockScreen: LockScreen()
        case .login: LoginScreen()
        case .desktop: DesktopScreen()
        }
    }
}
