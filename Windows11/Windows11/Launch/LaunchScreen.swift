//
//  LaunchScreen.swift
//  Windows11
//
//  Created by 晋先森 on 9/4/21.
//

import SwiftUI

struct LaunchScreen: View {
    
    @EnvironmentObject var windowObject: WindowStatusObject

    var body: some View {
        VStack {
            VStack {
                Spacer()
                Image("windows11").resizable().frame(width: 150.0, height: 150.0).padding(20.0)
                ActivityIndicator()
                    .frame(width: 50.0, height: 50.0)
                    .foregroundColor(.white)
                    .padding(.top, 100.0)
                Spacer()
                BottomToolBar(isDesktop: false)
            }.background(Color.textBlack)
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                windowObject.status = .lockScreen
            }
        }.background(Color.textBlack)
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

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
