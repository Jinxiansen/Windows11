//
//  NotificationsView.swift
//  Windows11
//
//  Created by 晋先森 on 9/4/21.
//

import SwiftUI

struct NotificationsView: View {
    
    private static let width: CGFloat = 350.0
    @State private var offset:CGFloat = width

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Manage notifications").padding([.top,.trailing], 10.0)
            }
            Spacer()
            HStack {
                Text("No new notifications").bold().multilineTextAlignment(.center)
            }
            Spacer()
            HStack {
                serverStatusView.padding([.bottom], 20.0)
            }
            
        }.frame(width: Self.width)
        //        .border(Color.black.opacity(0.25), width: 1.0)
        .background(Color.textWhite)
        .shadow(color: .clear, radius: 0, x: 0, y: 0) // clear superview shadow
        //        .transition(.asymmetric(insertion: .scale, removal: .opacity))
        .offset(x: offset, y: 0.0)
        .onAppear {
            withAnimation(.easeInOut) {
                self.offset = 0.0
            }
        }
    }
    
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible())]
    @State private var menuItems = QuickMenuType.allCases.map { QUickMenuItem(type: $0) }
    
    var serverStatusView: some View {
        VStack {
            HStack {
                Text("Collapse")
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach((0..<menuItems.count), id: \.self) { index in
                        QuickMenuCell(item: menuItems[index])
                            .onTapGesture {
                                print(menuItems[index].type)
                                menuItems[index].isSelected.toggle()
                                
                                if menuItems[index].type == .nightLight {
                                    PreferencesStore.shared.changeDarkMode()
                                }
                            }
                    }
                }
            }.frame(height: 200.0)
        }.padding(.init(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0))
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
