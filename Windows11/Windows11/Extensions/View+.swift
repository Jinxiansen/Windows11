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

extension View {
    @inlinable
    public func hidden(_ isHidden: Bool) -> some View {
        Group {
            if isHidden {
                hidden()
            } else {
                self
            }
        }
    }
}

//extension View {
//  @inlinable public func mask<Mask: View>(
//    alignment: Alignment = .center,
//    @ViewBuilder _ mask: () -> Mask
//  ) -> some View {
//    self.mask(alignment: alignment, mask())
//  }
//}


extension View {
    
    public func masking<T: View>(_ view: T) -> some View {
        hidden().background(view.mask(self))
    }
  @inlinable public func overlay<V: View>(
    alignment: Alignment = .center,
    @ViewBuilder content: () -> V
  ) -> some View {
    self.overlay(content(), alignment: alignment)
  }

  @inlinable public func background<V: View>(
    alignment: Alignment = .center,
    @ViewBuilder content: () -> V
  ) -> some View {
    self.background(content(), alignment: alignment)
  }
}
