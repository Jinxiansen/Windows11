//
//  BackgroundView.swift
//  Windows11
//
//  Created by 晋先森 on 8/31/21.
//

import SwiftUI

struct BackgroundView: View {
    let image = Image("backgroundBlack")
    var body: some View {
        image.resizable().aspectRatio(contentMode: .fill)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
