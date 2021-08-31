//
//  StatusBarView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct StatusBarView: View {
    var body: some View {
        HStack {
            Text("I'm Status Bar.").font(.largeTitle).foregroundColor(.white)
        }.padding(.trailing, 15.0)
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
