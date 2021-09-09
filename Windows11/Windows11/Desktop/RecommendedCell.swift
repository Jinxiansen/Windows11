//
//  RecommendedCell.swift
//  Windows11
//
//  Created by 晋先森 on 9/9/21.
//

import SwiftUI

struct RecommendedCell: View {
    let type: PinnedType
    var tapClosure: ((PinnedType) -> ())?
    
    var body: some View {
        HStack {
            HStack {
                Image(type.imageName).resizable().frame(width: 35.0, height: 35.0)
                    .shadow(color: .black.opacity(0.25), radius: 1, x: 0, y: 0)
                VStack(alignment: .leading, spacing: 3.0) {
                    Text(type.appName).foregroundColor(Color.darkTitle)
                    Text(type.appName).foregroundColor(Color.darkSubTitle).font(.caption)
                }
                Spacer()
            }
            Spacer()
        }//.background(Color.green)
        .frame(width: (LaunchpadConst.maxWidth - 30*3)/2)
    }
}

struct RecommendedCell_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCell(type: .alarm) { type in
            
        }
    }
}
