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
            Self.open()
        }
    }
}

extension AboutApp {
    static func open() {
        NSApplication.shared.orderFrontStandardAboutPanel(
            options:
                [
                    NSApplication.AboutPanelOptionKey.credits: NSAttributedString(
                        string: "This app is only provided for learning, demonstration and communication of SwiftUI, and does not contain any commercial purpose. If you have any questions, you can contact me by email: " + Const.email,
                        attributes: [
                            NSAttributedString.Key.font: NSFont.systemFont(
                                ofSize: NSFont.smallSystemFontSize)
                        ]
                    )
                ]
        )
    }
}

struct AboutApp_Previews: PreviewProvider {
    static var previews: some View {
        AboutApp()
    }
}
