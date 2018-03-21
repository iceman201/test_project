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
    private var menuTrailAnchor: NSLayoutConstraint?
    private var menuLeadAnchor: NSLayoutConstraint?
    private var menuHorizontalCenterAnchor: NSLayoutConstraint?
    private var menuVerticalCenterAnchor: NSLayoutConstraint?
    
    let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeDown))
    let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeUp))
    let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeLeft))
    let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeRight))
    
    private var topConstant: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.viewHeight = 300
        menu.viewWidth = 210
        menu.backgroundColor = .cyan
        
        addGesture()
        setup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        switch UIApplication.shared.statusBarOrientation {
        case .portrait:
            //do something
            menu.viewRotate = false
            break
        case .portraitUpsideDown:
            //do something
            break
        case .landscapeLeft:
            break
        case .landscapeRight:
            //            menu.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor).isActive = true
            menuTopAnchor?.isActive = false
            menuLeadAnchor?.isActive = true
            menu.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            menu.viewWidth = 300
            menu.viewHeight = 210
            break
        case .unknown:
            //default
            break
        }
    }
    
    func setup() {
        menu.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menu)
        
        menuTopAnchor = menu.topAnchor.constraint(equalTo: view.topAnchor)
        menuTopAnchor?.isActive = true
        
        menuHorizontalCenterAnchor = menu.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        menuHorizontalCenterAnchor?.isActive = true
        
        menuLeadAnchor = menu.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        menuTrailAnchor = menu.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    }
    
    func addGesture() {
        
        swipeDownGesture.direction = .down
        self.view.addGestureRecognizer(swipeDownGesture)
        
        
        swipeUpGesture.direction = .up
        self.view.addGestureRecognizer(swipeUpGesture)
        
//        swipeDownGesture.isEnabled = false
//        swipeUpGesture.isEnabled = false
        
        swipeLeftGesture.direction = .left
        self.view.addGestureRecognizer(swipeLeftGesture)
    }
    
    @objc func swipeDown() {
        menuTopAnchor?.constant = 0
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
    
    @objc func swipeUp() {
        menuTopAnchor?.constant = -300
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
    
    @objc func swipeLeft() {
        
    }
    @objc func swipeRight() {
        
    }
}

extension LGJViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        switch UIApplication.shared.statusBarOrientation {
        case .portrait:
            swipeUpGesture.isEnabled = true
            swipeDownGesture.isEnabled = true
            swipeRightGesture.isEnabled = false
            swipeLeftGesture.isEnabled = false
            self.view.layoutSubviews()
            break
        case .portraitUpsideDown:
            //do something
            break
        case .landscapeLeft:
            swipeUpGesture.isEnabled = false
            swipeDownGesture.isEnabled = false
            swipeLeftGesture.isEnabled = true
            swipeRightGesture.isEnabled = true
            self.view.layoutSubviews()
            
            //            menu.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor).isActive = true
            break
        case .landscapeRight:
            //            menu.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor).isActive = true
            break
        case .unknown:
            //default
            break
        }
    }
}
