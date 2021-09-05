//
//  BackgroundView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct BackgroundView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        Image(imageName).resizable().aspectRatio(contentMode: .fill)
    }
    
    var imageName: String {
        colorScheme == .light ? "backgroundWhite":"backgroundBlack"
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
