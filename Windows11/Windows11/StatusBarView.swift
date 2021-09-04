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
}

struct StatusBarView: View {
    
    @State var isDesktop: Bool
    @Binding var selectedType: StatusBarMenuType?
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var showingCalendar = false

    var body: some View {
        HStack {
            Spacer()
            HStack {
                generateMenuButton(iconName: "wifi") {
                    selectedType = .wifi
                }
                generateMenuButton(iconName: "battery") {
                    selectedType = .battery
                }
                
                if isDesktop {
                    generateMenuButton(iconName: "audio") {
                        selectedType = .loudspeaker
                    }
                    VStack {
                        Text("1:55 PM").font(.caption2)
                        Text("7/20/2021").font(.caption2)
                    }.onTapGesture {
                        showingCalendar.toggle()
                        selectedType = .time
                    }
                    generateMenuButton(iconName: "reply") {
                        selectedType = .notification
                    }
                }
                
                Divider()
            }
            
        }.padding(.trailing, 15.0)
    }
    
    func generateMenuButton(iconName: String, tapClosure: @escaping (() -> ())) -> some View {
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
        colorScheme == .light ? .black:.white
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(isDesktop: false, selectedType: .constant(nil))
    }
}
