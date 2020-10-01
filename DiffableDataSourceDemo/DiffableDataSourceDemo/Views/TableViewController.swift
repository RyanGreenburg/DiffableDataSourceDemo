//
//  TableViewController.swift
//  DiffableDataSourceDemo
//
//  Created by RYAN GREENBURG on 9/30/20.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var dataSource: UITableViewDiffableDataSource<ColorController.Section, Color>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = constructTableViewDataSource()
        applyData()
    }
    
    func constructTableViewDataSource() -> UITableViewDiffableDataSource<ColorController.Section, Color> {
        UITableViewDiffableDataSource(tableView: tableView) { (tableView, indexPath, color) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")
            
            cell?.backgroundColor = color.shade
            cell?.textLabel?.text = color.name
            
            return cell
        }
    }
    
    func applyData() {
        var snapshot = NSDiffableDataSourceSnapshot<ColorController.Section, Color>()
        snapshot.appendSections(ColorController.Section.allCases)
        snapshot.appendItems(ColorController.colors, toSection: .main)
        dataSource?.apply(snapshot)
    }
}

