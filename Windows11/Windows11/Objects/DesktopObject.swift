//
//  DesktopObject.swift
//  Windows11
//
//  Created by 晋先森 on 9/5/21.
//

import SwiftUI

class DesktopObject: ObservableObject {
    @Published var statusType: StatusBarMenuType?
    @Published var shortcutType: BottomShortcutType?
}

