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
    
    var iconImage: UIImage?
    var iconFont: String = ""
    private var currentType: MenuIconType?
    
    var type: MenuIconType? {
        didSet {
            if type == .Image {
                let menuIcon = UIImageView(image: iconImage)
                menuIcon.contentMode = .scaleAspectFit
                leftContainer.addSubview(menuIcon)
                menuIcon.translatesAutoresizingMaskIntoConstraints = false
                menuIcon.leadingAnchor.anchorWithOffset(to: leftContainer.leadingAnchor).constraint(equalToConstant: -5).isActive = true
                menuIcon.trailingAnchor.anchorWithOffset(to: leftContainer.trailingAnchor).constraint(equalToConstant: 5).isActive = true
                menuIcon.topAnchor.constraint(equalTo: leftContainer.topAnchor, constant: 5).isActive = true
                menuIcon.bottomAnchor.constraint(equalTo: leftContainer.bottomAnchor, constant: -5).isActive = true
            }
            if type == .AttributeText {
                let menuIcon = UILabel()
                menuIcon.text = iconFont
                leftContainer.addSubview(menuIcon)
                menuIcon.translatesAutoresizingMaskIntoConstraints = false
                menuIcon.leadingAnchor.anchorWithOffset(to: leftContainer.leadingAnchor).constraint(equalToConstant: 0).isActive = true
                menuIcon.trailingAnchor.anchorWithOffset(to: leftContainer.trailingAnchor).constraint(equalToConstant: 0).isActive = true
                menuIcon.topAnchor.constraint(equalTo: leftContainer.topAnchor, constant: 0).isActive = true
                menuIcon.bottomAnchor.constraint(equalTo: leftContainer.bottomAnchor, constant: 0).isActive = true
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init error")
    }
}
