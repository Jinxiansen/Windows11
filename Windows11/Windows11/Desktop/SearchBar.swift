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
                SecureField("PIN", text: $searchText) {
                    print("Commit.")
                }
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 5.0)
                .foregroundColor(Color.white)
                .focusable()
                .frame(height: 30.0)
                
                Divider().background(Color.primary)
            }.background(Color.purple)
        }.padding([.leading,.trailing], 30.0)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
