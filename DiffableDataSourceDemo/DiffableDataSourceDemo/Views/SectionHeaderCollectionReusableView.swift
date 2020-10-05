//
//  SectionHeaderCollectionReusableView.swift
//  DiffableDataSourceDemo
//
//  Created by RYAN GREENBURG on 10/5/20.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView {
    static let nibID = "\(SectionHeaderCollectionReusableView.self)"
    @IBOutlet weak var headerLabel: UILabel!
}
