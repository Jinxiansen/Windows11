//
//  RecommendedView.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

struct RecommendedView: View {
    
    private let gridItemLayout = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible())]
    @State private var menuItems = PinnedType.allCases
    
    var body: some View {
        VStack {
            HStack {
                Text("Recommended").bold()
                Spacer()
                Button {
                    print("more.")
                } label: {
                    HStack {
                        Text("More").foregroundColor(Color.textBlack)
                        Image(systemName: "chevron.right").foregroundColor(Color.textBlack)
                    }
                }
            }.padding([.leading,.trailing], 15.0)
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach((0..<menuItems.count), id: \.self) { index in
                        PinnedCell(type: menuItems[index]) { type in
                            print("Type: \(type)")
                        }
                    }
                }
            }.frame(height: 170.0)
        }.padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
    }
}

struct RecommendedView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView()
    }
}
