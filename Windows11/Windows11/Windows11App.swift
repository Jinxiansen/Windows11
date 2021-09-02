//
//  Windows11App.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

enum WindowStatus: Int, CaseIterable {
    case lockScreen
    case login
    case desktop
}

@main
struct Windows11App: App {
    
    @State var status = WindowStatus.lockScreen
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if status == .lockScreen { // not support `switch`
                    LockScreenView()
                } else if status == .login {
                    UserLoginView()
                } else {
                    DesktopView()
                }
            }.onTapGesture {
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
        status = WindowStatus(rawValue: status.rawValue + 1) ?? .lockScreen
    }
}
