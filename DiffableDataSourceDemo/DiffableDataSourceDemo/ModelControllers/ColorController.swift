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
    
    enum SortedSection: String, CaseIterable {
        case cool
        case warm
        
        var sectionTitle: String {
            self.rawValue.capitalized
        }
    }
    
    static let colors: [Color] = [ Color(color: .blue, name: "Blue", family: .cool),
                                   Color(color: .red, name: "Red", family: .warm),
                                   Color(color: .green, name: "Green", family: .cool),
                                   Color(color: .yellow, name: "Yellow", family: .warm),
                                   Color(color: .orange, name: "Orange", family: .warm),
                                   Color(color: .cyan, name: "Cyan", family: .cool),
                                   Color(color: .systemIndigo, name: "Indigo", family: .cool),
                                   Color(color: .purple, name: "Purple", family: .cool),
                                   Color(color: .magenta, name: "Magenta", family: .warm)]
}
