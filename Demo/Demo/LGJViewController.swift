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
    
    private let arrowLabel = UILabel()
    
    private var topConstant: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.backgroundColor = .cyan
        setup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        switch UIApplication.shared.statusBarOrientation {
        case .portrait:
            //do something
            break
        case .portraitUpsideDown:
            //do something
            break
        case .landscapeLeft:
            break
        case .landscapeRight:
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
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menu)
        view.addSubview(arrowLabel)
        
        setupTopConstrains()
//        setupLeftConstrains()

        arrowLabel.text = "<"
        arrowLabel.backgroundColor = .red
        arrowLabel.font.withSize(30)

        arrowLabel.heightAnchor.constraint(equalToConstant: 30)
        arrowLabel.widthAnchor.constraint(equalToConstant: 30)
    }
    
    fileprivate func setupLeftConstrains() {
        menu.viewRotate = .Left
        
        menu.viewHeight = 210
        menu.viewWidth = 300
        
        addLeftGesture()
        
        menuLeadAnchor = menu.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        menuLeadAnchor?.isActive = true
        
        menuVerticalCenterAnchor = menu.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        menuVerticalCenterAnchor?.isActive = true
        
        arrowLabel.leadingAnchor.constraint(equalTo: menu.trailingAnchor).isActive = true
        arrowLabel.centerYAnchor.constraint(equalTo: menu.centerYAnchor).isActive = true
    }
    
    fileprivate func addLeftGesture() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeLeft))
        swipeLeftGesture.direction = .left
        self.view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeRight))
        swipeRightGesture.direction = .right
        self.view.addGestureRecognizer(swipeRightGesture)
    }

    fileprivate func setupTopConstrains() {
        menu.viewRotate = .Top
        
        menu.viewHeight = 300
        menu.viewWidth = 210
        
        addTopGesture()
        
        menuTopAnchor = menu.topAnchor.constraint(equalTo: view.topAnchor)
        menuTopAnchor?.isActive = true
        
        menuHorizontalCenterAnchor = menu.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        menuHorizontalCenterAnchor?.isActive = true

        arrowLabel.topAnchor.constraint(equalTo: menu.bottomAnchor).isActive = true
        arrowLabel.centerXAnchor.constraint(equalTo: menu.centerXAnchor).isActive = true
    }
    
    fileprivate func addTopGesture() {
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeDown))
        swipeDownGesture.direction = .down
        self.view.addGestureRecognizer(swipeDownGesture)
        
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeUp))
        swipeUpGesture.direction = .up
        self.view.addGestureRecognizer(swipeUpGesture)
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
        menuLeadAnchor?.constant = -300
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
    
    @objc func swipeRight() {
        menuLeadAnchor?.constant = 0
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            
        }
    }
}

extension LGJViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        switch UIApplication.shared.statusBarOrientation {
        case .portrait:
            //do something
            break
        case .portraitUpsideDown:
            //do something
            break
        case .landscapeLeft:
            self.view.layoutSubviews()
            break
        case .landscapeRight:
            break
        case .unknown:
            //default
            break
        }
    }
}
