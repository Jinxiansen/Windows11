//
//  Windows11App.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

@main
struct Windows11App: App {
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer()
                    BottomToolBarView()
                }
            }
            
        }
    }
}
