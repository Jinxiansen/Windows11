//
//  TerminalView.swift
//  Windows11
//
//  Created by 晋先森 on 9/20/21.
//

import SwiftUI

struct TerminalView: View {
    
    @State private var scale: CGFloat = 0.85
    @EnvironmentObject private var desktopObject: DesktopObject
    
    var body: some View {
        VStack {
            HStack {
                toolView
            }
            contentView
        }
        .scaleEffect(scale)
        .onAppear {
            withAnimation(Animation.easeIn(duration: 0.15)) {
                scale = 1.0
            }
        }.background(Color.black.opacity(0.75))
        .frame(width: 800.0, height: 600.0)
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 2, y: 0)
        .supportDrag()
    }
    
    private var titleView: some View {
        GeometryReader { proxy in
            HStack(alignment: .center, spacing: 0) {
                Image("run").resizable().frame(width: 20.0, height: 20.0).padding(.horizontal, 5.0)
                Text("Windows PowerShell").lineLimit(1).foregroundColor(Color.white)
                Button {
                    print("Close.")
                } label: {
                    Image("close").resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.white)
                        .frame(width: 11.0, height: 11.0)
                        .padding(.horizontal, 5.0)
                }.buttonStyle(PlainButtonStyle())
            }.frame(width: 160.0, height: proxy.size.height)
            .background(Color.main.opacity(0.25))
        }
        
    }
    
    private var toolView: some View {
        HStack {
            titleView.padding([.leading,.top], 5.0)
            Spacer()
            WindowStatusBar(tintColor: Color.white) {
                self.statusBarClick(type: $0)
            }.padding(.trailing, 5.0)
        }.background(Color.black.opacity(0.5))
        .frame(height: 40.0)
    }
    
    private var contentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10.0) {
                Group {
                    Text("Windows PowerShell\nCopyright (C) Microsoft Corporation. All rights reserved")
                    Text("Install the latest PowerShell for new features and improvements!")
                    Text("PS C:\\Users\\Jinxiansen\\Desktop>")
                }.foregroundColor(Color.white.opacity(0.9))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(5.0)
        }
    }
}

private extension TerminalView {
    
    func statusBarClick(type: WindowStatusType) {
        switch type {
        case .close,.minimize:
            desktopObject.shortcutType = nil
        default:
            break
        }
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
    }
}
