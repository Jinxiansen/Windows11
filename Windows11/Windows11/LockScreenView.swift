//
//  LockScreenView.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct LockScreenView: View {
    
    @State private var selectedType: StatusBarMenuType?

    var body: some View {
        BackgroundView()
        VStack {
            HStack {
                lockTime
                Spacer()
            }
            Spacer()
            BottomToolBarView(isDesktop: false, selectedType: $selectedType)
        }
    }
        
    var lockTime: some View {
        HStack {
            Spacer()
            VStack {
                Text(timeText).bold().font(.system(size: 50.0)).foregroundColor(Color.white).padding(.top, 75.0)
                Text(fullText).font(.system(size: 15.0)).foregroundColor(Color.white)
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

struct LockScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LockScreenView()
    }
}
