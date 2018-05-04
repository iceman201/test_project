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
    
    // Private properties
    var items: [String] = []
    var imageArray: [UIImage] = []
    
    var selectedIndexPath: Int?
    var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    var selectRowAnimationHandler: ((_ finished: Bool) -> ())?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.separatorColor = .clear
        
        self.register(LGJTableMenuCell.self, forCellReuseIdentifier: menuCellIdentifier)
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: menuCellIdentifier, for: indexPath) as? LGJTableMenuCell {
            cell.menuTitle.text = items[indexPath.row]
            cell.menuTitle.textColor = .white
            cell.iconImage = imageArray[indexPath.row]
            cell.type = .Image
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        self.selectRowAtIndexPathHandler?(indexPath.row)
        self.selectRowAnimationHandler?(true)
        self.reloadData()
        let cell = tableView.cellForRow(at: indexPath) as? LGJTableMenuCell
        
        // TODO: add select color?
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //TODO: Deselect cell color?
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }

}
