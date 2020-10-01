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
    let id: String
    
    init(color: UIColor, name: String) {
        self.name = name
        shade = color
        id = UUID().uuidString
    }
}
