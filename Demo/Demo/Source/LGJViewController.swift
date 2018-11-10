//
//  LGJViewController.swift
//  DraggetMenu
//
//  Created by Liguo Jiao on 20/03/18.
//  Copyright © 2018 Liguo Jiao. All rights reserved.
//

import UIKit

class LGJViewController: UIViewController {
    private var menuTopAnchor: NSLayoutConstraint?
    private var menuTrailAnchor: NSLayoutConstraint?
    private var menuLeadAnchor: NSLayoutConstraint?
    private var menuHorizontalCenterAnchor: NSLayoutConstraint?
    private var menuVerticalCenterAnchor: NSLayoutConstraint?
    
    var menu: MenuView?
    
    private let arrowIcon = UIImageView()
    private let topPadding = UIApplication.shared.statusBarFrame.height - 45
    private var topConstant: CGFloat?
    
    lazy var rollbackMenu = {
        [unowned self] in
        if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            self.swipeUp()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkDirection()
        menu?.didSelectAnimationHandler = { (finished:Bool) -> Void in
            if (finished) {
                self.rollbackMenu()
            }
        }
    }

    fileprivate func checkDirection() {
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
            if let mView = menu {
                view.subviews.contains(mView) ? mView.removeFromSuperview() : nil;
                view.subviews.contains(arrowIcon) ? arrowIcon.removeFromSuperview() : nil;
            }
            setup()
            setupLeftConstrains()
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {

        }
        else if UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown {
            
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            if let mView = menu {
                view.subviews.contains(mView) ? mView.removeFromSuperview() : nil;
                view.subviews.contains(arrowIcon) ? arrowIcon.removeFromSuperview() : nil;
            }
            setup()
            setupTopConstrains()
        }
    }
    
    fileprivate func setup() {
        setupAnimation()
        menu = MenuView()
        menu?.translatesAutoresizingMaskIntoConstraints = false
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        arrowIcon.image = UIImage(named: "down_arrow", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        arrowIcon.contentMode = .scaleAspectFit
        
        view.addSubview(menu!)
        view.addSubview(arrowIcon)

        arrowIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        arrowIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    fileprivate func setupLeftConstrains() {
        menu?.viewRotate = .Left
        addLeftGesture()
        menuLeadAnchor = menu?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        menuLeadAnchor?.isActive = true
        menuVerticalCenterAnchor = menu?.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        menuVerticalCenterAnchor?.isActive = true
        arrowIcon.leadingAnchor.constraint(equalTo: (menu?.trailingAnchor)!).isActive = true
        arrowIcon.centerYAnchor.constraint(equalTo: (menu?.centerYAnchor)!).isActive = true
    }
    
    fileprivate func addLeftGesture() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeLeft))
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeRight))
        swipeLeftGesture.direction = .left
        swipeRightGesture.direction = .right
        self.view.addGestureRecognizer(swipeLeftGesture)
        self.view.addGestureRecognizer(swipeRightGesture)
    }

    fileprivate func setupTopConstrains() {
        menu?.viewRotate = .Top
        addTopGesture()
        menuTopAnchor = menu?.topAnchor.constraint(equalTo: view.topAnchor, constant: -300 + topPadding)
        menuTopAnchor?.isActive = true
        menuHorizontalCenterAnchor = menu?.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        menuHorizontalCenterAnchor?.isActive = true
        arrowIcon.topAnchor.constraint(equalTo: (menu?.bottomAnchor)!).isActive = true
        arrowIcon.centerXAnchor.constraint(equalTo: (menu?.centerXAnchor)!).isActive = true
    }
    
    fileprivate func addTopGesture() {
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeDown))
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(LGJViewController.swipeUp))
        swipeDownGesture.direction = .down
        swipeUpGesture.direction = .up
        self.view.addGestureRecognizer(swipeDownGesture)
        self.view.addGestureRecognizer(swipeUpGesture)
    }
    
    fileprivate func setupAnimation() {
        UIView.animate(withDuration: 1.0, animations: {
            self.arrowIcon.alpha = 0
        }) { (done) in
            UIView.animate(withDuration: 1.0, animations: {
                self.arrowIcon.alpha = 1
            }, completion: { (done) in
                self.setupAnimation()
            })
        }
    }
    
    @objc func swipeDown() {
        menuTopAnchor?.constant = 0
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            self.arrowIcon.image = UIImage(named: "up_arrow", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        }
    }
    
    @objc func swipeUp() {
        menuTopAnchor?.constant = -300 + topPadding
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            self.arrowIcon.image = UIImage(named: "down_arrow", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        }
    }
    
    @objc func swipeLeft() {
        menuLeadAnchor?.constant = -300 + topPadding - 5
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
        checkDirection()
    }
}
