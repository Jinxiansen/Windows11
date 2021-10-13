//
//  PinnedType.swift
//  Windows11
//
//  Created by 晋先森 on 9/8/21.
//

import Foundation

enum PinnedType: String, CaseIterable {
    case code
    case edge
    case todo
    case settings
    case excel
    case winWord
    case twitter
    case explorer
    case feedback
    case alarm
    case board
    case calculator
    case calender
    case camera
    case cortana
    case oneNote
    case groove
    case oneDrive
    case mail
    case maps
    case movies
    case msoffice
    case narrator
    case news
    case teams
}

extension PinnedType {
    var appName: String {
        switch self {
        case .code: return "VS Code"
        case .winWord: return "Word"
        default: return rawValue.capitalized
        }
    }

    var imageName: String {
        switch self {
        case .winWord, .oneDrive: return rawValue
        default:
            return rawValue.lowercased()
        }
    }
}
