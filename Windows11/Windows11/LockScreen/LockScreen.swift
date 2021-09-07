//
//  LockScreen.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct LockScreen: View {
    
    @EnvironmentObject var windowObject: WindowStatusObject
    @State private var offset:CGFloat = -75.0

    var body: some View {
        ZStack {
            ZStack {
                BackgroundView()
                VStack {
                    HStack {
                        lockTime
                        Spacer()
                    }.offset(x: 0.0, y: offset)
                    .onAppear {
                        withAnimation(.easeInOut) {
                            self.offset = 0.0
                        }
                    }.animation(
                        .interpolatingSpring(
                          mass: 1,
                          stiffness: 100,
                          damping: 10,
                          initialVelocity: 0
                        )
                      )
                    Spacer()
                    BottomToolBarView(isDesktop: false)
                }
            }
        }.onTapGesture {
            windowObject.status = .login
        }

    }
        
    var lockTime: some View {
        HStack {
            Spacer()
            VStack {
                Text(timeText).bold().font(.system(size: 50.0)).foregroundColor(.white).padding(.top, 75.0)
                Text(fullText).font(.system(size: 15.0)).foregroundColor(.white)
            }
            Spacer()
        }
    }
    
    let formatter = DateFormatter()
    var fullText: String {
        formatter.dateFormat = "eeee d, MMMM"
        return formatter.string(from: Date())
    }
    var timeText: String {
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: Date())
    }
    
    
}

struct LockScreen_Previews: PreviewProvider {
    static var previews: some View {
        LockScreen()
    }
}
