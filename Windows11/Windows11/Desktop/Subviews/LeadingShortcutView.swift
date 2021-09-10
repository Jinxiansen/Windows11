//
//  LeadingShortcutView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct LeadingShortcutView: View {
    
    let names = ["code","settings","excel","winWord","msoffice","movies","help","oneDrive"]
    
    var body: some View {
        VStack {
            ForEach(names, id: \.self) { name in
                Button {
                    print(name)
                } label: {
                    Image(name).resizable().frame(maxWidth: 35.0, maxHeight: 35.0).padding(10.0)
                }.buttonStyle(PlainButtonStyle())
                .onHoverBackground()
            }
        }.padding([.top,.leading,.bottom], 15.0)
    }
}

struct LeadingShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        LeadingShortcutView()
    }
}
