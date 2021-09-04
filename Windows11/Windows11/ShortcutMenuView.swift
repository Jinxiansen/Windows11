//
//  ShortcutMenuView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

enum ShortcutMenuType: CaseIterable {
//    case launchPad
    case search
//    case news
    case setting
//    case folder
//    case explorer
//    case store
    
    var icon: Image {
        switch self {
//        case .launchPad: return Image("")
        case .search: return Image("search")
        case .setting: return Image("settings")
        }
    }
}

struct ShortcutMenuItem {
    let type: ShortcutMenuType
}

struct ShortcutMenuView: View {
    
    @State private var showingCalendar = false
    let cases = ShortcutMenuType.allCases
    
    var body: some View {
        HStack {
            ForEach(cases, id: \.self) { type in
                Button {
                    menuItemClick(type: type)
                } label: {
                    type.icon.resizable().frame(maxWidth: 25.0, maxHeight: 25.0).padding(5.0)
                }.buttonStyle(PlainButtonStyle())
            }
        }.alert(isPresented: $showingCalendar) {
            Alert(title: Text("I'm title\n Please enter your name and password."), primaryButton: .cancel({
                print("Cancel.")
            }), secondaryButton: .default(Text("Done"), action: {
                print("Done.")
            }))
        }
    }
    
    func menuItemClick(type: ShortcutMenuType) {
        switch type {
        case .search:
            print("Search...")
        case .setting:
            showingCalendar.toggle()
        default:
            print("Type: \(type)")
        }
        
    }
}

struct ShortcutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutMenuView()
    }
}
