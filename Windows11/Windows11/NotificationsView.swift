//
//  NotificationsView.swift
//  Windows11
//
//  Created by 晋先森 on 9/4/21.
//

import SwiftUI

struct NotificationsView: View {
    
    private static let width: CGFloat = 300.0
    @State private var offset:CGFloat = width
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Manage Notifications").padding([.top,.trailing], 10.0)
                }
                Spacer()
                Text("No new notifications").multilineTextAlignment(.center)
                Spacer()
                serverStatusView
            }
        }.frame(width: Self.width)
//        .border(Color.black.opacity(0.25), width: 1.0)
        .background(Color.white)
        .shadow(color: .clear, radius: 0, x: 0, y: 0)
//        .transition(.asymmetric(insertion: .scale, removal: .opacity))
        .offset(x: offset, y: 0.0)
        .onAppear {
            withAnimation(.easeInOut) {
                self.offset = 0.0
            }
        }
        
    }
    
    var serverStatusView: some View {
        VStack {
            Text("Collapse")
            HStack {
                Text("Collapse")
                Text("Collapse")
                Text("Collapse")
                Text("Collapse")
                Text("Collapse")
            }.background(Color.white)
        }.padding(.init(top: 0.0, leading: 20.0, bottom: 30.0, trailing: 20.0))
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
