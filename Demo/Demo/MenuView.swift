//
//  MenuView.swift
//  Demo
//
//  Created by Liguo Jiao on 20/03/18.
//  Copyright © 2018 Liguo Jiao. All rights reserved.
//

import UIKit

class MenuView: UIView {
    open var viewHeight: CGFloat? {
        didSet {
            setNeedsLayout()
        }
    }
    
    open var viewWidth: CGFloat? {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                setup()
                print("iPhone X")
            default:
                assertionFailure("isn't iphone X")
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        if let width = viewWidth, let heigh = viewHeight {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
            self.heightAnchor.constraint(equalToConstant: heigh).isActive = true
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 30, height: 20))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path  = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func setup() {
        self.backgroundColor = .cyan
        
//        This is test code
        let textview = UITextView()
        textview.text = "Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.        The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKit/UIView.h> may also be helpful.        2018-03-21 00:49:10.106566+1300 Demo[61512:70926821] [LayoutConstraints] Unable to simultaneously satisfy constraints."
        self.addSubview(textview)
        textview.backgroundColor = .clear
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.isUserInteractionEnabled = false
        textview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        textview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        textview.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        textview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
}
