//
//  PreferencesStore.swift
//  Windows11
//
//  Created by 晋先森 on 9/5/21.
//

import SwiftUI

class PreferencesStore: ObservableObject {
    
    static let shared = PreferencesStore()
//    @AppStorage("currentColorScheme")
    @Published var colorScheme: ColorTheme = .light {
        didSet {
            objectWillChange.send()
        }
    }

    static var colorScheme = shared.colorScheme
    
    func changeDarkMode() {
        print("Color: \(colorScheme)")
        colorScheme = colorScheme == .light ? .dark:.light
    }
    
}


enum ColorTheme: Int {
    case light
    case dark
    
    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
