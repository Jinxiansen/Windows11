//
//  RightClickView.swift
//  Windows11
//
//  Created by 晋先森 on 9/5/21.
//

import SwiftUI

struct RightClickView: View {
    var body: some View {
        VStack {
            Menu("View") {
                Button {
                    print("Large.")
                } label: {
                    Text("   ") + Text("Large icons")
                }

                Button {
                    print("Medium.")
                } label: {
                    Text("   ") + Text("Medium icons")
                }

                Button {
                    print("Small.")
                } label: {
                    Text("• ").bold().font(.system(size: 15)) + Text("Small icons")
                }

                Divider()

                Button {
                    print("Show desktop icons")
                } label: {
                    HStack {
                        Image("check")
                        Text("Show desktop icons")
                    }
                }
            }

            Menu("Sort by") {
                Button {
                    print("Name.")
                } label: {
                    Text("Name")
                }

                Button {
                    print("Size.")
                } label: {
                    Text("Size")
                }

                Button {
                    print("Date modified.")
                } label: {
                    Text("Date modified")
                }
            }

            Button {
                print("Refresh.")
            } label: {
                Text("Refresh")
            }

            Divider()

            Group {
                Button {
                    print("paste.")
                } label: {
                    Text("Paste").foregroundColor(Color.gray)
                }

                Button {
                    print("view.")
                } label: {
                    Text("Paste Shortcut").foregroundColor(Color.gray)
                }

                Button {
                    print("Undo Delete.")
                } label: {
                    Text("Undo Delete")
                }

                Button {
                    print("Next desktop background.")
                } label: {
                    Text("Next desktop background")
                }

                Button {
                    print("Open in Windows Terminal.")
                } label: {
                    Text("Open in Windows Terminal")
                }
            }

            Divider()

            Button {
                print("New.")
            } label: {
                Text("New")
            }

            Divider()

            Group {
                Button {
                    print("Personalize.")
                } label: {
                    Text("Personalize")
                }
                Button {
                    print("About.")
                    AboutApp.open()
                } label: {
                    Text("About")
                }
            }

        }.frame(width: 220)
    }
}

struct RightClickView_Previews: PreviewProvider {
    static var previews: some View {
        RightClickView()
    }
}
