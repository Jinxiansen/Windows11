//
//  View+.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

public extension View {
    @inlinable @ViewBuilder
    func isHidden(_ isHidden: Bool) -> some View {
        if !isHidden {
            self
        }
    }
    
    @inlinable @ViewBuilder
    func isShow(_ isShow: Bool) -> some View {
        if isShow {
            self
        }
    }
}

public extension View {
    func masking<T: View>(_ view: T) -> some View {
        hidden().background(view.mask(self))
    }
    
    @inlinable func overlay<V: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> V
    ) -> some View {
        overlay(content(), alignment: alignment)
    }
    
    @inlinable func background<V: View>(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> V
    ) -> some View {
        background(content(), alignment: alignment)
    }
}

struct OnHoverBackground: ViewModifier {
    @State private var isHovered = false
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
        modifier(OnHoverBackground())
    }
}

struct SupportDragDrop: ViewModifier {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    func body(content: Content) -> some View {
        content
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, _ in
                        state = value.translation
                    })
                    .onEnded { value in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    }
            )
    }
}

extension View {
    func supportDragDrop() -> some View {
        modifier(SupportDragDrop())
    }
}
