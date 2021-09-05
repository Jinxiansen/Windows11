//
//  Windows11App.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

class WindowStatusObject: ObservableObject {
    @Published var status = WindowStatus.desktop
    
}

enum WindowStatus: Int, CaseIterable {
    case launch
    case lockScreen
    case login
    case desktop
}

@main
struct Windows11App: App {
    
    @StateObject var windowObject = WindowStatusObject()
    @StateObject var store = PreferencesStore.shared
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if windowObject.status == .launch {  // not support `switch`
                    LaunchView()
                } else if windowObject.status == .lockScreen {
                    LockScreenView()
                } else if windowObject.status == .login {
                    UserLoginView()
                } else {
                    DesktopView()
                }
            }
            .environmentObject(windowObject)
            .preferredColorScheme(.light)
            .preferredColorScheme(store.colorScheme.colorScheme)
            .onTapGesture {
                withAnimation {
                    statusChanged()
                }
            }
            .frame(minWidth: 1280.0, idealWidth: 2560, maxWidth: 3840, minHeight: 800.0, idealHeight: 1600.0, maxHeight: 2400.0, alignment: .center)
        }
    }
    
    func statusChanged() {
        //        guard status != .desktop else {
        //            print("Desktop view: \(arc4random())")
        //            return }
//        status = WindowStatus(rawValue: status.rawValue + 1) ?? .lockScreen
    }
}
