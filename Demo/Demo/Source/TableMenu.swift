//
//  TableMenu.swift
//  Demo
//
//  Created by Liguo Jiao on 6/04/18.
//  Copyright © 2018 Liguo Jiao. All rights reserved.
//

import UIKit

class TableMenu: UITableView, UITableViewDelegate, UITableViewDataSource {
    private let menuCellIdentifier = "menuCell"
    var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    
    // Private properties
    var items: [String] = []
    var selectedIndexPath: Int?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: menuCellIdentifier)
        cell.textLabel?.text = "test haha"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        self.selectRowAtIndexPathHandler?(indexPath.row)
        self.reloadData()
        let cell = tableView.cellForRow(at: indexPath)
        // do customization of cell selection
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }

}
