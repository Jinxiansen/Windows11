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
    @State private var showingCalendar = false

    var body: some View {
        HStack {
            Spacer()
            HStack {
                Button {
                    print("WiFi")
                    selectedType = .wifi
                } label: {
                    Text("WiFi")
                }.buttonStyle(PlainButtonStyle())
                
                Button {
                    print("Battery")
                    selectedType = .battery
                } label: {
                    Text("🔋")
                }.buttonStyle(PlainButtonStyle())
                
                if isDesktop {
                    Button {
                        print("loudspeaker")
                        selectedType = .loudspeaker
                    } label: {
                        Text("🔈")
                    }.buttonStyle(PlainButtonStyle())
                    
                    VStack {
                        Text("1:55 PM").font(.caption2)
                        Text("7/20/2021").font(.caption2)
                    }.onTapGesture {
                        showingCalendar.toggle()
                        selectedType = .time
                    }
                }
                
                Button {
                    print("Notification.")
                    selectedType = .notification
                } label: {
                    Image("Blank").resizable().frame(maxWidth: 30.0, maxHeight: 30.0)
                }.buttonStyle(PlainButtonStyle())

                Divider()
            }
            
        }.padding(.trailing, 15.0)
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(isDesktop: false, selectedType: .constant(nil))
    }
}
