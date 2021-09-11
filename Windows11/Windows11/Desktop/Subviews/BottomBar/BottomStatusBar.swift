//
//  BottomStatusBar.swift
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

struct BottomStatusBar: View {
    
    @State var isDesktop: Bool
    @EnvironmentObject var desktopObject: DesktopObject
    
    var body: some View {
        HStack {
            Spacer()
            HStack(alignment: VerticalAlignment.center, spacing: 0.0) {
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
                        Text(timeText).font(.caption2)
                        Text(fullText).font(.caption2)
                    }.padding(2.0)
                    .onTapGesture {
                        toggle(type: .time)
                    }.onHoverBackground()
                    
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
            withAnimation {
                desktopObject.statusType = type
            }
        } else {
            desktopObject.statusType = nil
        }
    }
    
    func generateMenuButton(iconName: String,
                            tapClosure: @escaping (() -> ())) -> some View {
        HStack {
            Button {
                tapClosure()
            } label: {
                Image(iconName)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 16.0, height: 16.0)
                    .foregroundColor(Color.darkTitle)
            }.buttonStyle(PlainButtonStyle())
            .padding(3.0)
        }
        .onHoverBackground()
    }
    
    let formatter = DateFormatter()
    var timeText: String {
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: Date())
    }
    var fullText: String {
        formatter.dateFormat = "d/M/yyyy"
        return formatter.string(from: Date())
    }
}

struct BottomStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomStatusBar(isDesktop: false)
    }
}
