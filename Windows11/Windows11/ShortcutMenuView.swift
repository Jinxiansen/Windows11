//
//  ShortcutMenuView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct ShortcutMenuView: View {
    
    let names = ["Computer","Settings","User","Video file","Zip","Help","Folder Desktop"]
    
    var body: some View {
        HStack {
            ForEach(names, id: \.self) {
                Image($0).resizable().frame(maxWidth: 32.0, maxHeight: 32.0)
            }
        }
    }
}

struct ShortcutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutMenuView()
    }
}
