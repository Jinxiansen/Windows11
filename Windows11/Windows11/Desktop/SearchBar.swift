//
//  SearchBar.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

struct SearchBar: View {
    
    @State var searchText: String = ""

    var body: some View {
        VStack {
            VStack {
                SecureField(" 🔎 Type here to search", text: $searchText) {
                    print("Commit.")
                }
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.top,.leading,.trailing], 5.0)
//                .foregroundColor(Color.white)
//                .focusable()
                .frame(height: 30.0)
                
                Divider().background(Color.darkBlue).frame(height: 2.0)
            }.background(Color.lightTitle)
            .border(Color.darkTitle, width: 1.0)
        }.padding([.leading,.trailing], 30.0)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
