//
//  ViewController.swift
//  ContainerViewSample
//
//  Created by Saranraj CM on 05/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentview: UISegmentedControl!
    @IBOutlet weak var containerview: UIView!
    var displayName : DisplayNameView?
    var emailView:EmailView?
    private var currentView:UIView?
    
    private let firstView:UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let secondView:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy private var childviews = [UIView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setupInitialView()
        displayName = DisplayNameView.loadXib()
        emailView = EmailView.loadXib()
        childviews = [displayName!, emailView!]
        
        
//        containerview.addSubview(displayName!)
//        displayName?.changeName("krishna")
        displayName?.changeName("kumar")
        
        displayName?.handle = {[weak self](type: String) -> Void in
            print(type)
        }
        
        displayName?.handle = { [weak self](type: String) -> Void in
            
        }
    }
    
    private func setupInitialView() {
        self.setupChildView(subview: firstView)
    }
    
    private func setupChildView(subview:UIView) {
        currentView?.removeFromSuperview()
        currentView = subview
        currentView?.translatesAutoresizingMaskIntoConstraints = false
        guard let currentview = currentView else {return}
        containerview.addSubview(currentview)
        
        NSLayoutConstraint.activate([
            currentview.topAnchor.constraint(equalTo: containerview.topAnchor),
            currentview.leftAnchor.constraint(equalTo: containerview.leftAnchor),
            currentview.rightAnchor.constraint(equalTo: containerview.rightAnchor),
            currentview.bottomAnchor.constraint(equalTo: containerview.bottomAnchor)
        ])
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        if segmentview.selectedSegmentIndex == 0 {
            self.setupChildView(subview: displayName!)
//            displayName?.changeName(<#T##name: String##String#>, handler: getName(name:))
        }
        else {
            self.setupChildView(subview: emailView!)
        }
    }
    
    func getName(_ name:(String)-> Void) {
        
    }
    
    

}

