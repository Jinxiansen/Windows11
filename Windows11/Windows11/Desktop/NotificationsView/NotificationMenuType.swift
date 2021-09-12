//
//  NotificationMenuType.swift
//  Windows11
//
//  Created by 晋先森 on 9/12/21.
//

import SwiftUI

enum NotificationMenuType: String, CaseIterable {
    case location = "Location"
    case batterySaver = "Battery saver"
    case nightLight = "Night light"
    case bluetooth = "Bluetooth"
    case airplaneMode = "Airplane mode"
    case nearbySharing = "Nearby sharing"
    case allSettings = "All settings"
    case network = "Network"
    case connect = "Connect"
    case project = "Project"
    case vpn = "VPN"
    case focusAssist = "Focus assist"

    var icon: Image {
        let name: String
        switch self {
        case .location: name = "location"
        case .batterySaver: name = "battery"
        case .nightLight: name = "nightlight"
        case .bluetooth: name = "bluetooth"
        case .airplaneMode: name = "airplane"
        case .nearbySharing: name = "nearshare"
        case .allSettings: name = "settings"
        case .network: name = "network"
        case .connect: name = "connect"
        case .project: name = "project"
        case .vpn: name = "shield"
        case .focusAssist: name = "moon"
        }
        return Image(name)
    }
}
