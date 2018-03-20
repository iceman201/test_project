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
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.viewHeight = 300
        menu.viewWidth = 210
        menu.backgroundColor = .cyan
        
        menu.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LGJViewController.tap)))
        
        addGesture()

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setup()
    }
    
    func setup() {
        view.addSubview(menu)
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menu.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
        self.menu.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -100).isActive = true
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
    
    @objc func tap() {
        moveDown()
    }
    
    @objc func swipeDown() {
        self.menu.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
    
    @objc func swipeUp() {
        self.menu.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -100).isActive = true
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
}
