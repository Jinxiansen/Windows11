//
//  PinnedCell.swift
//  Windows11
//
//  Created by 晋先森 on 9/8/21.
//

import SwiftUI

struct PinnedCell: View {
    
    let type: PinnedType
    var tapClosure: ((PinnedType) -> ())?
    
    var body: some View {
        VStack {
            Button {
                tapClosure?(type)
            } label: {
                VStack {
                    Image(type.imageName).resizable().frame(width: 25.0, height: 25.0)
                        .shadow(color: .black.opacity(0.25), radius: 1, x: 0, y: 0)
                    Text(type.appName).foregroundColor(Color.darkTitle)
                }
            }.buttonStyle(PlainButtonStyle())
        }//.background(Color.green)
        .padding(3.0)
        .onHoverBackground()
    }
}

struct PinnedCell_Previews: PreviewProvider {
    static var previews: some View {
        PinnedCell(type: .winWord)
    }
}
