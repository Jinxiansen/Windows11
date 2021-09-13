//
//  LeadingShortcutView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct LeadingShortcutView: View {
    var body: some View {
        GeometryReader { proxy in
            ShortcutView(size: .init(width: proxy.size.width,
                                     height: proxy.size.height - Const.bottomStatusHeight))
        }
    }
}

private struct ShortcutView: View {
    let size: CGSize
    private let rows: Int
    private var columns: Int = 1
    
    @EnvironmentObject private var desktopObject: DesktopObject
    @State private var types: [PinnedType] = PinnedType.allCases.reversed()
    
    private let cellSize = CGSize(width: 75.0, height: 70.0)
    
    init(size: CGSize) {
        self.size = size
        
        rows = Int((size.height - 15.0 * 2) / cellSize.height)
        columns = Int(types.count / rows)
        if types.count % rows > 0 {
            columns += 1
        }
        print("rows:\(rows) cloumns:\(columns)")
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(0 ..< columns, id: \.self) { columnIndex in
                VStack(spacing: 0) {
                    ForEach(0 ..< rows, id: \.self) { rowIndex in
                        let index = Int(columnIndex * rows + rowIndex)
                        if index > types.count - 1 {
                            Spacer()
                        } else {
                            cellButton(type: types[index])
                        }
                    }
                }
            }
        }
        .padding(.init(top: 10.0, leading: 15.0, bottom: 10.0, trailing: 10.0))
    }
    
    private func cellButton(type: PinnedType) -> some View {
        Button {
            shortcutClick(type: type)
        } label: {
            VStack {
                Image(type.imageName)
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .shadow(color: .black.opacity(0.25),
                            radius: 1, x: 0, y: 0)
                Text(type.appName)
                    .foregroundColor(Color.white.opacity(0.85))
            }
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: cellSize.width, height: cellSize.height)
        .onHoverBackground()
    }
    
    func shortcutClick(type: PinnedType) {
        print("shortcutClick Type: \(type)")
        
        if type == .settings {
            desktopObject.shortcutType = .settings
        }
    }
}

struct LeadingShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        LeadingShortcutView()
    }
}
