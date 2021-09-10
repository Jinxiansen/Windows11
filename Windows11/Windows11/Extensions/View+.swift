//
//  View+.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

extension View {
    func toAny() -> AnyView {
        AnyView(self)
    }
}

struct OnHoverBackground: ViewModifier {
    @State var isHovered = false
    func body(content: Content) -> some View {
        content
            .background(isHovered ? Color.hover : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))
        .onHover { isHovered in
            self.isHovered = isHovered
        }
    }
}

extension View {
    func onHoverBackground() -> some View {
        self.modifier(OnHoverBackground())
    }
}
