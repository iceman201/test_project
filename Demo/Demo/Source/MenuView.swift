//
//  MenuView.swift
//  Demo
//
//  Created by Liguo Jiao on 20/03/18.
//  Copyright © 2018 Liguo Jiao. All rights reserved.
//

import UIKit

enum MenuDirection {
    case Top
    case Left
    case Right
}

enum MenuType {
    case Column
    case Icon
}

class MenuView: UIView {
    private let topPadding = UIApplication.shared.statusBarFrame.height - 15
    
    open var menuStyle: MenuType!
    open var viewHeight: CGFloat?
    open var viewWidth: CGFloat?
    open var viewRotate: MenuDirection? {
        didSet {
            if viewRotate == MenuDirection.Top {
                self.viewHeight = 300
                self.viewWidth = 210
            } else if viewRotate == MenuDirection.Left {
                self.viewHeight = 210
                self.viewWidth = 350
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        menuStyle = .Column
        
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
        
        if viewRotate == .Left {
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 30, height: 20))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path  = maskPath.cgPath
            self.layer.mask = maskLayer
        } else {
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 30, height: 20))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path  = maskPath.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    func setup() {
        self.backgroundColor = .black
        let tableMenu = TableMenu()
        let textview = menuStyle == .Column ? tableMenu : UITextView()
        
        let image1 = UIImage(named: "001-communication", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        let image2 = UIImage(named: "002-arrows", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        let image3 = UIImage(named: "003-favorite", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        let image4 = UIImage(named: "004-social", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        let image5 = UIImage(named: "005-multimedia", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        let image6 = UIImage(named: "006-delete", in: Bundle(path: Bundle.main.path(forResource: "MenuImage", ofType: "bundle")!), compatibleWith: nil)
        let testTitle = ["communication", "arrows", "favorite", "social", "multimedia", "delete"]
        
        tableMenu.imageArray = [image1, image2, image3, image4, image5, image6] as! [UIImage]
        tableMenu.items = testTitle
        
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
