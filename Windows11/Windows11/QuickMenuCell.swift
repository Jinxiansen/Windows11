//
//  QuickMenuCell.swift
//  Windows11
//
//  Created by 晋先森 on 9/5/21.
//

import SwiftUI

struct QuickMenuCell: View {
    @ObservedObject var item: QUickMenuItem

    var body: some View {
        VStack {
            VStack {
                HStack {
                    item.type.icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(item.isSelected ? Color.white:Color.black)
                        .frame(width: 12, height: 12)
                    Spacer()
                }.padding([.top,.leading], 5.0)
                
                HStack {
                    Text(item.type.rawValue).font(.caption).lineLimit(nil).frame(height: 30.0).foregroundColor(item.isSelected ? Color.white:Color.black)
                    Spacer()
                }.padding([.top,.leading], 5.0)
            }
        }.background(item.isSelected ? Color.main:Color.white)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.2)))
    }
}

struct QuickMenuCell_Previews: PreviewProvider {
    static var previews: some View {
        QuickMenuCell(item: .init(type: .airplaneMode))
    }
}
