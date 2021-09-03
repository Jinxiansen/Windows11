//
//  AboutWindowsView.swift
//  Windows11
//
//  Created by 晋先森 on 9/4/21.
//

import SwiftUI

struct AboutWindowsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("About Windows").padding([.top,.leading], 10.0)
                Spacer()
            }.frame(height: 25.0)
            contentView.padding([.horizontal], 30.0).background(Color(red: 0.8, green: 0.8, blue: 0.9).opacity(0.1))

        }.frame(width: 500.0)
        .border(Color.black.opacity(0.25), width: 1.0)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
        .shadow(color: .black.opacity(0.55), radius: 3, x: 0, y: 2)

    }
    
    private var contentView: some View {
        VStack {
            HStack {
                Image("Computer").resizable().frame(width: 65.0, height: 65.0)
                Text("Windows 11").font(.system(size: 45.0)).bold().foregroundColor(.blue)
            }
            Divider()
            Group {
                HStack {
                    Text("Microsoft Windows (in SwiftUI)\nVersion 21H4(OS Build 23500.92)\n© Blue Edge. All right reserved.")
                    Spacer()
                }
                
                Text("Windows has always existed to be a stage for the world’s innovation. It’s been the backbone of global businesses and where scrappy startups became household names. The web was born and grew up on Windows. It’s the place where many of us wrote our first email, played our first PC game and wrote our first line of code. Windows is the place people go to create, to connect, to learn and to achieve – a platform over a billion people today rely on.").padding(.top, 5.0)
            }
            .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Text("This product is licensed with xxx\ncontact: hi@jinxiansen.com\nThis is current status.").fixedSize(horizontal: false, vertical: true)
                Spacer()
            }.padding(.top, 5.0)
            
            HStack {
                Spacer()
                Button("Ok") {
                    print("Ok.")
                }
                .frame(width: 100.0, height: 30.0)
                .border(Color.blue, width: 1.5)
                .background(Color.white)
                .buttonStyle(PlainButtonStyle())
            }.padding([.bottom], 20.0)
        }
        
    }
}

struct AboutWindowsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutWindowsView()
    }
}
