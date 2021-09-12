//
//  LeadingShortcutView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct LeadingShortcutView: View {
  
    @EnvironmentObject var desktopObject: DesktopObject
    @State private var types: [PinnedType] = [.todo,.settings,.news,.mail,.oneDrive,.github,.twitter,.excel,.movies]
    
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
        }.padding([.top,.leading,.bottom], 15.0)
    }
    
    func shortcutClick(type: PinnedType) {
        print("Recommended Type: \(type)")
        
        if type == .settings {
            desktopObject.shortcutType = .settings
        }
        
//        switch type {
//        default:
//            break
//        }
    }
    
}

struct LeadingShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        LeadingShortcutView()
    }
}
