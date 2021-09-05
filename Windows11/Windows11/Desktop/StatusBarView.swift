//
//  StatusBarView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

enum StatusBarMenuType {
    case notification
    case time
    case loudspeaker
    case battery
    case wifi
    case more
    case nightLight
    
}

struct StatusBarView: View {
    
    @State var isDesktop: Bool
    @EnvironmentObject var desktopObject: DesktopObject
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                generateMenuButton(iconName: "wifi") {
                    toggle(type: .wifi)
                }
                generateMenuButton(iconName: "battery") {
                    toggle(type: .battery)
                }
                
                generateMenuButton(iconName: "moon") {
                    toggle(type: .nightLight)
                    PreferencesStore.shared.changeDarkMode()
                }
                
                if isDesktop {
                    generateMenuButton(iconName: "audio") {
                        toggle(type: .loudspeaker)
                    }
                    VStack {
                        Text("1:55 PM").font(.caption2)
                        Text("7/20/2021").font(.caption2)
                    }.onTapGesture {
                        toggle(type: .time)
                    }
                    generateMenuButton(iconName: "reply") {
                        toggle(type: .notification)
                    }
                }
                
                Divider()
            }
            
        }.padding(.trailing, 15.0)
    }
    
    func toggle(type: StatusBarMenuType) {
        if desktopObject.statusType != type {
            desktopObject.statusType = type
        } else {
            desktopObject.statusType = nil
        }
    }
    
    func generateMenuButton(iconName: String,
                            tapClosure: @escaping (() -> ())) -> some View {
        Button {
            tapClosure()
        } label: {
            Image(iconName)
                .renderingMode(.template)
                .resizable()
                .frame(width: 16.0, height: 16.0)
                .foregroundColor(iconColor)
        }.buttonStyle(PlainButtonStyle())
    }
    
    var iconColor: Color {
        Color.textBlack
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(isDesktop: false)
    }
}
