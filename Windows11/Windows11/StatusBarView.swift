//
//  StatusBarView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct StatusBarView: View {
    
    @State private var showingCalendar = false

    var body: some View {
        HStack {
//            Text("I'm Status Bar.").font(.largeTitle).foregroundColor(.white)
            Spacer()
            
            HStack {
                
                Button {
                    print("WiFi")
                } label: {
                    Text("WiFi")
                }.buttonStyle(PlainButtonStyle())
                
                Button {
                    print("Battery")
                } label: {
                    Text("🔋")
                }.buttonStyle(PlainButtonStyle())
                
                Button {
                    print("loudspeaker")
                } label: {
                    Text("🔈")
                }.buttonStyle(PlainButtonStyle())
                
                VStack {
                    Text("1:55 PM").font(.caption2)
                    Text("7/20/2021").font(.caption2)
                }.onTapGesture {
                    showingCalendar.toggle()
                }.popover(isPresented: $showingCalendar, arrowEdge: .bottom) {
                    ContentContentView(calendar: Calendar(identifier: .republicOfChina)).frame(width: 320.0, height: 320.0)
                }
                
                Button {
                    print("Blank.")
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
        StatusBarView()
    }
}
