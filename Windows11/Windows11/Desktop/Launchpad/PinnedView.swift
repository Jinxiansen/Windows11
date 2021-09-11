//
//  PinnedView.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

struct PinnedView: View {
    
    @EnvironmentObject var desktopObject: DesktopObject
    
    private let gridItemLayout = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible())]
    @State private var menuItems = PinnedType.allCases
    
    var body: some View {
        VStack {
            HStack {
                Text("Pinned").bold().padding(.leading, 15.0)
                Spacer()
                Button {
                    print("all apps.")
                } label: {
                    HStack {
                        Text("All apps").foregroundColor(Color.darkTitle)
                        Image(systemName: "chevron.right").foregroundColor(Color.darkTitle)
                    }
                }.padding(.trailing, 30.0)
            }
            HStack(alignment: VerticalAlignment.center) {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: gridItemLayout) {
                        ForEach((0..<menuItems.count), id: \.self) { index in
                            PinnedCell(type: menuItems[index]) {
                                pinnedTypeClick(type: $0)
                            }
                        }
                    }
                }.frame(width: LaunchpadConst.maxWidth - LaunchpadConst.margin * 2,
                        height: 180.0)
                PageIndicator().frame(width: 10.0).padding(.trailing, 10.0)
            }
        }.padding(.init(top: 20, leading: 30, bottom: 0, trailing: 0))
    }
    
    func pinnedTypeClick(type: PinnedType) {
        print("Pinned Type: \(type)")
        switch type {
        case .settings:
            desktopObject.shortcutType = .settings
        default:
            break
        }
    }
}


struct PageIndicator: View {
    @State private var currentPage = 0
    let numPages: Int = 3
    
    private let spacing: CGFloat = 5
    private let dotSize: CGFloat = 8
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: spacing) {
                ForEach(0 ..< numPages, id: \.self) { index in
                    Image(systemName: "circle.fill")
                        .frame(width: currentSize(index: index),
                               height: currentSize(index: index))
                        .clipShape(RoundedRectangle(cornerRadius: currentRadius(index: index)))
                        .animation(.spring())
                        .onTapGesture {
                            self.currentPage = index
                        }
                }
            }
        }
    }
    
    func currentSize(index: Int) -> CGFloat {
        currentPage == index ? dotSize:dotSize/2
    }
    
    func currentRadius(index: Int) -> CGFloat {
        currentPage == index ? dotSize/2:dotSize/4
    }
}

struct PinnedView_Previews: PreviewProvider {
    static var previews: some View {
        PinnedView()
    }
}
