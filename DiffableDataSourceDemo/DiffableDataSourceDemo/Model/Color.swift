//
//  Color.swift
//  DiffableDataSourceDemo
//
//  Created by RYAN GREENBURG on 9/30/20.
//

import UIKit

struct Color: Hashable {
    let name: String
    let color: UIColor
    let id: String
    
    init(color: UIColor) {
        name = String(color.description)
        self.color = color
        id = UUID().uuidString
    }
}
