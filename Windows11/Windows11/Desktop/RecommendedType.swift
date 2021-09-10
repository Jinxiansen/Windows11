//
//  RecommendedType.swift
//  Windows11
//
//  Created by 晋先森 on 9/10/21.
//

import Foundation

enum RecommendedType: String, CaseIterable {
    case xbox
    case weather
    case pinterest
    case code
    case yammer
    case widget
    
}

extension RecommendedType {
    
    var description: (title: String, subTitle: String) {
        switch self {
        case .xbox: return ("Xbox Official Site", "Xbox is a video gaming brand created and owned by Microsoft.")
        case .weather: return ("MSN Weather","The best way to plan your day")
        case .pinterest: return ("Pinterest App","Pinterest is a free site to use, and as such, the app is free as well")
        case .code: return ("VS Code", "Visual Studio Code")
        case .yammer: return ("Yammer.com","Yammer is a collaboration tool that helps you connect and engage across the company")
        case .widget: return ("Widget Launcher","Microsoft is adding a new widget to the Windows 11 taskbar")
        }
    }
    
    var imageName: String {
        return rawValue.lowercased()
    }
}
