//
//  RecommendedView.swift
//  Windows11
//
//  Created by 晋先森 on 9/7/21.
//

import SwiftUI

struct RecommendedView: View {
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var menuItems = RecommendedType.allCases

    var body: some View {
        VStack {
            HStack {
                Text("Recommended").bold()
                Spacer()
                Button {
                    print("more.")
                } label: {
                    HStack {
                        Text("More").foregroundColor(Color.darkTitle)
                        Image(systemName: "chevron.right").foregroundColor(Color.darkTitle)
                    }
                }
            }.padding([.leading, .trailing], 0.0)
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(0 ..< menuItems.count, id: \.self) { index in
                        RecommendedCell(type: menuItems[index]) {
                            recommendedTypeClick(type: $0)
                        }
                    }
                }
            }.frame(height: 150.0)
        }.padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
    }

    func recommendedTypeClick(type: RecommendedType) {
        print("Recommended Type: \(type)")
//        switch type {
//        default:
//            break
//        }
    }
}

struct RecommendedView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView()
    }
}
