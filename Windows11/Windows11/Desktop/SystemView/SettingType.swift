//
//  SettingType.swift
//  Windows11
//
//  Created by 晋先森 on 9/11/21.
//

import Foundation

enum SettingType: String, CaseIterable {
    case system
    case bluetooth
    case network
    case personalization
    case apps
    case accounts
    case time
    case gaming
    case accessibility
    case privacy
    case update
}

extension SettingType {
    var title: String {
        switch self {
        case .bluetooth: return "Bluetooth & devices"
        case .network: return "Network & internet"
        case .time: return "Time & language"
        case .privacy: return "Privacy & security"
        case .update: return "Windows Update"
        default: return rawValue.capitalized
        }
    }

    var imageName: String {
        switch self {
        case .system: return "system"
        case .bluetooth: return "yphone"
        case .network: return "internet"
        case .personalization: return "people"
        case .apps: return "store"
        case .accounts: return "user"
        case .time: return "alarm"
        case .gaming: return "soltaire"
        case .accessibility: return "board"
        case .privacy: return "security"
        case .update: return "widget"
        }
    }
}
