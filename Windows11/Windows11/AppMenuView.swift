//
//  AppMenuView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct AppMenuView: View {
    
    @State private var showingCalendar = false
    
    let names = ["Computer","Settings","User","Video file","Zip","Help","Folder Desktop"]
    
    var body: some View {
        VStack {
            ForEach(names, id: \.self) { name in
                Button {
                    print(name)
                } label: {
                    Image(name).resizable().frame(maxWidth: 35.0, maxHeight: 35.0).padding(10.0)
                }.buttonStyle(PlainButtonStyle())
            }
        }.padding([.top,.leading,.bottom], 15.0)
        
    }
}

struct AppMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AppMenuView()
    }
}
