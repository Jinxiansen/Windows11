//
//  LaunchView.swift
//  Windows11
//
//  Created by 晋先森 on 9/4/21.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var windowObject: WindowStatusObject
    @State private var selectedType: StatusBarMenuType?
    
    @State private var isLoading = false
    
    var body: some View {
        BackgroundView()
        VStack {
            Spacer()
            ActivityIndicator()
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(.white)
            Spacer()
            BottomToolBarView(isDesktop: false, selectedType: $selectedType)
        }
    }
    
}

struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    circleView(geometry: geometry, index: index)
                }.frame(width: geometry.size.width, height: geometry.size.height)
                .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                .animation(Animation
                            .timingCurve(0.5, 0.15 + Double(index)/5, 0.25, 1, duration: 1.5)
                            .repeatForever(autoreverses: false))
//                            .repeatCount(1))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
    
    func circleView(geometry: GeometryProxy, index: Int) -> some View {
        let value: CGFloat = !self.isAnimating ? 1 - CGFloat(index)/5 : 0.2 + CGFloat(index)/5
        return Circle()
            .frame(width: geometry.size.width/5, height: geometry.size.height/5)
            .scaleEffect(value)
            .offset(y: geometry.size.width/10 - geometry.size.height/2)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
