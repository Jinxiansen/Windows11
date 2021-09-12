//
//  LeadingShortcutView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct LeadingShortcutView: View {
    @EnvironmentObject private var desktopObject: DesktopObject
    @State private var types: [PinnedType] = [.todo, .news, .settings, .mail, .oneDrive, .github, .twitter, .excel, .movies]
    
    var body: some View {
        VStack {
            ForEach(types, id: \.self) { type in
                Button {
                    print(type.appName)
                } label: {
                    VStack {
                        Image(type.imageName).resizable().frame(width: 30.0, height: 30.0)
                            .shadow(color: .black.opacity(0.25), radius: 1, x: 0, y: 0)
                        Text(type.appName).foregroundColor(Color.white.opacity(0.85))
                    }.padding(5.0)
                    .onTapGesture {
                        shortcutClick(type: type)
                    }
                    
                }.buttonStyle(PlainButtonStyle())
                .onHoverBackground()
            }
        }.padding([.top, .leading, .bottom], 15.0)
    }
    
    func shortcutClick(type: PinnedType) {
        print("shortcutClick Type: \(type)")
        
        if type == .settings {
            desktopObject.shortcutType = .settings
        }
    }
}

struct LeadingShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        LeadingShortcutView()
    }
}
