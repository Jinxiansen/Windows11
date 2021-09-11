//
//  AboutApp.swift
//  Windows11
//
//  Created by 晋先森 on 9/11/21.
//

import SwiftUI

struct AboutApp: View {
    var body: some View {
        Button("About Windows 11") {
            NSApplication.shared.orderFrontStandardAboutPanel(
                options:
                    [
                        NSApplication.AboutPanelOptionKey.credits: NSAttributedString(
                            string: Const.email,
                            attributes: [
                                NSAttributedString.Key.font: NSFont.boldSystemFont(
                                    ofSize: NSFont.smallSystemFontSize)
                            ]
                        )
                    ]
            )
        }
    }
}

struct AboutApp_Previews: PreviewProvider {
    static var previews: some View {
        AboutApp()
    }
}
