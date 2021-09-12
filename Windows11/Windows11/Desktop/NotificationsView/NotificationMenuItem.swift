//
//  NotificationMenuItem.swift
//  Windows11
//
//  Created by 晋先森 on 9/5/21.
//

import SwiftUI

class NotificationMenuItem: ObservableObject {
    let type: NotificationMenuType
    var isSelected: Bool {
        didSet {
            objectWillChange.send()
        }
    }
    
    init(type: NotificationMenuType, isSelected: Bool = false) {
        self.type = type
        self.isSelected = isSelected
    }
}

extension NotificationMenuItem: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return Mirror(reflecting: self).children.map { "\($0.label!):\($0.value)" }.joined(separator: "\n")
    }
}
