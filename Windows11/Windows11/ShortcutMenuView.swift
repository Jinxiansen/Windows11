//
//  ShortcutMenuView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct ShortcutMenuView: View {
    
    @State private var showingCalendar = false
    
    let names = ["Computer","Settings","User","Video file","Zip","Help","Folder Desktop"]
    
    var body: some View {
        HStack {
            ForEach(names, id: \.self) {
                Image($0).resizable().frame(maxWidth: 26.0, maxHeight: 26.0).padding(5.0)
                    .onTapGesture {
                    showingCalendar.toggle()
                }.popover(isPresented: $showingCalendar, arrowEdge: .bottom) {
                    LazyHStack {
                        Text(".ssss")
                    }
                }
            }
        }
    }
}

struct ShortcutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutMenuView()
    }
}
