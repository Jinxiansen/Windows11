//
//  NotificationMenuCell.swift
//  Windows11
//
//  Created by 晋先森 on 9/5/21.
//

import SwiftUI

struct NotificationMenuCell: View {
    @ObservedObject var item: NotificationMenuItem

    var body: some View {
        VStack {
            VStack {
                HStack {
                    item.type.icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(item.isSelected ? Color.lightTitle : Color.darkTitle)
                        .frame(width: 12, height: 12)
                    Spacer()
                }.padding([.top, .leading], 5.0)
                
                HStack {
                    Text(item.type.rawValue).font(.caption).lineLimit(nil).frame(height: 30.0).foregroundColor(item.isSelected ? Color.lightTitle : Color.darkTitle)
                    Spacer()
                }.padding([.top, .leading], 5.0)
            }
        }
        .background(item.isSelected ? Color.checked : Color.unchecked)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.darkTitle.opacity(0.2)))
        .onHoverBackground()
    }
}

struct NotificationMenuCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationMenuCell(item: .init(type: .airplaneMode))
    }
}
