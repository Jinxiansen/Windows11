//
//  AboutWindowsView.swift
//  Windows11
//
//  Created by 晋先森 on 9/4/21.
//

import SwiftUI

struct AboutWindowsView: View {
    @State private var isShowing = true
    
    var body: some View {
        VStack {
            HStack {
                contentView.padding(EdgeInsets(top: 50.0, leading: 120.0, bottom: 0, trailing: 0))
                Spacer()
            }
            Spacer()
        }.isShow(isShowing)
    }
    
    private var contentView: some View {
        VStack {
            HStack {
                Text("About Windows")
                    .padding([.top, .leading], 10.0)
                Spacer()
                Button {
                    isShowing.toggle()
                } label: {
                    Image(systemName: "xmark").resizable().renderingMode(.template).foregroundColor(Color.gray).frame(width: 15.0, height: 15.0).padding([.top, .trailing], 10.0)
                }.buttonStyle(PlainButtonStyle())
                
            }.frame(height: 25.0)
            .background(Color.lightTitle.opacity(0.8))
            
            descriptionView
                .padding([.horizontal], 30.0)
                .background(Color(red: 0.8, green: 0.8, blue: 0.9).opacity(0.1))
            
        }.frame(width: 500.0)
        .background(Color.lightTitle)
        .clipShape(RoundedRectangle(cornerRadius: 3.0))
        .shadow(color: .black.opacity(0.55), radius: 3, x: 0, y: 2)
        .supportDragDrop()
    }
    
    private var descriptionView: some View {
        VStack {
            HStack {
                Image("windows11").resizable().frame(width: 65.0, height: 65.0)
                Text("Windows 11").font(.system(size: 45.0)).bold().foregroundColor(.main)
            }.padding(.top, 10.0)
            Divider()
            VStack(alignment: HorizontalAlignment.leading, spacing: 5.0) {
                Text("Microsoft Windows (SwiftUI)\nVersion Dev(OS Build 21996.1)\n© Microsoft Corporation. All right reserved.").font(.callout)
                Text("This application is only provided for learning, demonstration and communication of SwiftUI, and does not contain any commercial purpose.\nIf you have any questions, you can contact me by email: \(Const.email)").font(.callout)
                
                HStack {
                    Text("This product is licensed with:")
                    Link("MIT License.", destination: URL(string: Const.licenseURL)!).onHoverBackground()
                    Spacer()
                }.padding(.top, 10.0)
            }
            
            HStack {
                Spacer()
                Button {
                    print("Ok.")
                    isShowing.toggle()
                } label: {
                    Text("Ok")
                        .frame(width: 100.0, height: 30.0)
                        .contentShape(Rectangle())
                }
                .border(Color.main, width: 1.5)
                .background(Color.lightTitle)
                .buttonStyle(PlainButtonStyle())
                
            }.padding([.bottom], 20.0)
            .contentShape(Rectangle())
        }
    }
}

struct AboutWindowsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutWindowsView()
    }
}
