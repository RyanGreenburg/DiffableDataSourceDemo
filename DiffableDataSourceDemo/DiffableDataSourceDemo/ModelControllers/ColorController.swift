//
//  ColorController.swift
//  DiffableDataSourceDemo
//
//  Created by RYAN GREENBURG on 9/30/20.
//

import Foundation

struct ColorController {
    enum Section: CaseIterable {
        case main
    }
    
    enum SortedSection: CaseIterable {
        case cool
        case warm
    }
    
    static let colors: [Color] = [ Color(color: .blue, name: "Blue"),
                                   Color(color: .red, name: "Red"),
                                   Color(color: .green, name: "Green"),
                                   Color(color: .yellow, name: "Yellow"),
                                   Color(color: .cyan, name: "Cyan"),
                                   Color(color: .systemIndigo, name: "Indigo"),
                                   Color(color: .purple, name: "Purple"),
                                   Color(color: .magenta, name: "Magenta")]
}
