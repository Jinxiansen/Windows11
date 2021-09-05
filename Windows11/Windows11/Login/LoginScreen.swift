//
//  LoginScreen.swift
//  Windows11
//
//  Created by 晋先森 on 9/2/21.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var windowObject: WindowStatusObject
    
    @State var pinCode: String = "jinxiansen"

    var body: some View {
        BackgroundView().blur(radius: 20.0)
        VStack {
            HStack {
                contentView
                Spacer()
            }
            Spacer()
            BottomToolBarView(isDesktop: false)
        }
    }
    
    var contentView: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                avatarView
                Text("Jinxiansen").foregroundColor(.white).bold().font(.title)
                pinCodeView.padding(.top, 15.0)
                
                Button {
                    print("Forgot password.")
                } label: {
                    Text("I forgot my password").font(.title3).foregroundColor(.gray)
                }.padding(.top, 10.0)
                .buttonStyle(PlainButtonStyle())

                Button {
                    print("Sign-In options")
                } label: {
                    Text("Sign-In options").font(.title3).foregroundColor(.gray)
                }.padding(.top, 15.0)
                .buttonStyle(PlainButtonStyle())
                
                HStack {
                    Button {
                        print("keyboard")
                    } label: {
                        Image("keyboard").resizable().frame(width: 40.0, height: 40.0)
                    }.buttonStyle(PlainButtonStyle())
                    
                    Button {
                        print("Key")
                    } label: {
                        Image("keyboard").resizable().frame(width: 40.0, height: 40.0)
                    }.buttonStyle(PlainButtonStyle())

                }
                
                Spacer()
            }
            Spacer()
        }
    }
    
    var pinCodeView: some View {
        HStack {
            SecureField("PIN", text: $pinCode) {
                print("Commit.")
            }
            .textFieldStyle(PlainTextFieldStyle())
            .padding([.horizontal], 5.0)
            .foregroundColor(Color.white)
            .focusable()
            Spacer()
            Button {
                print("Arrow")
                windowObject.status = .desktop
            } label: {
                Text("􀰑").bold().font(.largeTitle).foregroundColor(.white.opacity(0.75))
            }.buttonStyle(PlainButtonStyle())
            .padding(.trailing, 10.0)
        }.frame(width: 240.0, height: 40.0, alignment: .center)
        .background(Color(red: 0.1, green: 0.1, blue: 0.3))
//        .cornerRadius(2)
        .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.white.opacity(0.3)))
    }
    
    var avatarView: some View {
        Image("jinxiansen")
            .resizable()
            .frame(width: 120, height: 120.0)
            .clipShape(Circle())
            .shadow(radius: 10.0)
            .overlay(Circle().stroke(Color.black.opacity(0.3), lineWidth: 2.0))
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
