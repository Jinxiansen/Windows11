//
//  PinnedView.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

struct PinnedView: View {
    
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
                        Text("All apps").foregroundColor(Color.textBlack)
                        Image(systemName: "chevron.right").foregroundColor(Color.textBlack)
                    }
                }.padding(.trailing, 30.0)
            }
            HStack(alignment: VerticalAlignment.center) {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout) {
                        ForEach((0..<menuItems.count), id: \.self) { index in
                            PinnedCell(type: menuItems[index]) { type in
                                print("Type: \(type)")
                            }
                        }
                    }
                }.frame(width: LaunchpadConst.maxWidth - LaunchpadConst.margin * 2,height: 170.0)//.background(Color.green)
                PageIndicator().frame(width: 10.0)
            }//.background(Color.pink)
        }.padding(.init(top: 20, leading: 30, bottom: 0, trailing: 0))
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
