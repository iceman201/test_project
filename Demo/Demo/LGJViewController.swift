//
//  LGJViewController.swift
//  Demo
//
//  Created by Liguo Jiao on 20/03/18.
//  Copyright © 2018 Liguo Jiao. All rights reserved.
//

import UIKit

class LGJViewController: UIViewController {
    let menu = MenuView()
    
    private var menuTopAnchor: NSLayoutConstraint?
    private var menuHorizontalCenterAnchor: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.viewHeight = 300
        menu.viewWidth = 210
        menu.backgroundColor = .cyan
        
        menu.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LGJViewController.tap)))
        
        addGesture()
        setup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    func setup() {
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menu)
        menuTopAnchor = menu.topAnchor.constraint(equalTo: view.topAnchor)
        menuTopAnchor?.isActive = true
        menuHorizontalCenterAnchor = menu.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        menuHorizontalCenterAnchor?.isActive = true
    }
    
    func addGesture() {
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeDown))
        swipeDownGesture.direction = .down
        self.view.addGestureRecognizer(swipeDownGesture)
        
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeUp))
        swipeUpGesture.direction = .up
        self.view.addGestureRecognizer(swipeUpGesture)
    }
    
    func moveDown() {
        // test code
//        menuTopAnchor?.isActive = true
        menuTopAnchor?.constant = 0
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
    
    @objc func tap() {
        moveDown()
    }
    
    @objc func swipeDown() {
        menuTopAnchor?.constant = 200
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
    
    @objc func swipeUp() {
        menuTopAnchor?.constant = 0
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
}
