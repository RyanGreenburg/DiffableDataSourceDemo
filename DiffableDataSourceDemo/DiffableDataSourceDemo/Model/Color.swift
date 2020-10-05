//
//  Color.swift
//  DiffableDataSourceDemo
//
//  Created by RYAN GREENBURG on 9/30/20.
//

import UIKit

struct Color: Hashable {
    let name: String
    let shade: UIColor
    let family: ColorController.SortedSection
    let id: String
    
    init(color: UIColor, name: String, family: ColorController.SortedSection) {
        self.name = name
        shade = color
        id = UUID().uuidString
        self.family = family
    }
}
