//
//  LGJTableMenuCell.swift
//  Demo
//
//  Created by Liguo Jiao on 15/04/18.
//  Copyright © 2018 Liguo Jiao. All rights reserved.
//

import UIKit

enum MenuIconType {
    case Image
    case AttributeText
}

class LGJTableMenuCell: UITableViewCell {
    let menuTitle: UILabel = UILabel()
    let leftContainer: UIView = UIView()
    var type: MenuIconType?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        leftContainer.backgroundColor = .yellow
        type = .Image
        
        menuTitle.textAlignment = .center
        menuTitle.font.withSize(15)
        
        
        
        self.addSubview(leftContainer)
        self.addSubview(menuTitle)
        
        leftContainer.translatesAutoresizingMaskIntoConstraints = false
        leftContainer.leadingAnchor.anchorWithOffset(to: self.leadingAnchor).constraint(equalToConstant: 0).isActive = true
        leftContainer.heightAnchor.constraint(equalToConstant: 35).isActive = true
        leftContainer.widthAnchor.constraint(equalToConstant: 35).isActive = true
        leftContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        menuTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        menuTitle.leadingAnchor.anchorWithOffset(to: leftContainer.trailingAnchor).constraint(equalToConstant: 0).isActive = true
        menuTitle.trailingAnchor.anchorWithOffset(to: self.trailingAnchor).constraint(equalToConstant: 0).isActive = true
        menuTitle.heightAnchor.constraint(equalToConstant: 35).isActive = true
        menuTitle.backgroundColor = .cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init error")
    }
}
