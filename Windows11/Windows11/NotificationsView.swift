//
//  NotificationsView.swift
//  Windows11
//
//  Created by 晋先森 on 9/4/21.
//

import SwiftUI

enum QuickMenuType: String, CaseIterable {
    case location = "Location"
    case batterySaver = "Battery saver"
    case nightLight = "Night light"
    case bluetooth = "Bluetooth"
    case airplaneMode = "Airplane mode"
    case nearbySharing = "Nearby sharing"
    case allSettings = "All settings"
    case network = "Network"
    case connect = "Connect"
    case project = "Project"
    case vpn = "VPN"
    case focusAssist = "Focus assist"
    
    var icon: Image {
        let name: String
        switch self {
        case .location: name = "location"
        case .batterySaver: name = "battery"
        case .nightLight: name = "nightlight"
        case .bluetooth: name = "bluetooth"
        case .airplaneMode: name = "airplane"
        case .nearbySharing: name = "nearshare"
        case .allSettings: name = "settings"
        case .network: name = "network"
        case .connect: name = "connect"
        case .project: name = "project"
        case .vpn: name = "shield"
        case .focusAssist: name = "moon"
        }
        return Image(name)
    }
}

struct NotificationsView: View {
    
    private static let width: CGFloat = 350.0
    @State private var offset:CGFloat = width
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Manage Notifications").bold().padding([.top,.trailing], 10.0)
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
        .background(Color.white)
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
    private let menuItems = QuickMenuType.allCases
    
    var serverStatusView: some View {
        VStack {
            HStack {
                Text("Collapse").bold()
                Spacer()
            }
            HStack {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout) {
                        ForEach((0..<menuItems.count), id: \.self) { index in
                            girdItem(type: menuItems[index])
                                .onTapGesture {
                                    print(menuItems[index].rawValue)
                                }
                        }
                    }
                }.frame(height: 200.0)
            }
        }.padding(.init(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0))
    }
    
    func girdItem(type: QuickMenuType) -> some View {
        VStack {
            VStack {
                HStack {
                    type.icon
                        .resizable()
                        .frame(width: 12, height: 12)
                    Spacer()
                }.padding([.top,.leading], 5.0)
                
                HStack {
                    Text(type.rawValue).font(.caption).lineLimit(nil).frame(height: 30.0)
                    Spacer()
                }.padding([.top,.leading], 5.0)
            }.border(Color.gray.opacity(0.5), width: 0.5)
        }.background(Color.white)
        .cornerRadius(2.0)
        //        .border(Color.black, width: 0.5)
        .shadow(color: .black.opacity(0.35), radius: 1)
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
