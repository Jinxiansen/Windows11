//
//  SystemMenuType.swift
//  Windows11
//
//  Created by 晋先森 on 9/11/21.
//

import Foundation

enum SystemMenuType: String, CaseIterable {
    case display
    case sound
    case notifications
    case focusAssist
    case power
    case storage
    case multitasking
    case troubleshoot
}

extension SystemMenuType {
    var info: (title: String, subTitle: String) {
        switch self {
        case .display: return ("Display", "Monitors, brightness, night light, display profile")
        case .sound: return ("Sound", "volume levels, output, input, sound devices")
        case .notifications: return ("Notifications", "Alerts from apps and system")
        case .focusAssist: return ("Focus assist", "Notifications, automatic rules")
        case .power: return ("Power", "Sleep, battery usage, battery saver")
        case .storage: return ("Storage", "Storage space, drives, configuration rules")
        case .multitasking: return ("Multitasking", "Snap windows, desktops, task switching")
        case .troubleshoot: return ("Troubleshoot", "Recommended troubleshooters, preferences, history.")
        }
    }

    var imageName: String {
        switch self {
        case .display: return "connect"
        case .sound: return "audio"
        case .notifications: return "connect"
        case .focusAssist: return "moon"
        case .power: return "power"
        case .storage: return "minimize"
        case .multitasking: return "project"
        case .troubleshoot: return "trouble"
        }
    }
}
