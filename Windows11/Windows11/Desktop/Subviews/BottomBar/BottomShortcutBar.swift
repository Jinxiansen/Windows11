//
//  BottomShortcutBar.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

enum BottomShortcutType: CaseIterable {
    case launchpad
    case search
    case news
    case setting
//    case folder
//    case explorer
    case store
    case trash
    
    var icon: Image {
        switch self {
        case .launchpad: return Image("home")
        case .search: return Image("search3")
        case .news: return Image("news")
        case .setting: return Image("settings")
        case .store: return Image("store")
        case .trash: return Image("bin0")
        }
    }
}

struct BottomShortcutBar: View {
    
    private let cases = BottomShortcutType.allCases
    @EnvironmentObject var desktopObject: DesktopObject

    var body: some View {
        HStack {
            ForEach(cases, id: \.self) { type in
                Button {
                    withAnimation {
                        desktopObject.shortcutType = type
                    }
                } label: {
                    type.icon.resizable()
                        .frame(maxWidth: 25.0, maxHeight: 25.0)
                        .padding(5.0)
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    func menuItemClick(type: BottomShortcutType) {
        
        switch type {
        case .search:
            print("Search...")
//        case .setting:
//            showingCalendar.toggle()
        default:
            print("Type: \(type)")
        }
        
    }
}

struct BottomShortcutBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomShortcutBar()
    }
}
