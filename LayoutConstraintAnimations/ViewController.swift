//
//  ViewController.swift
//  LayoutConstraintAnimations
//
//  Created by Christopher Schlitt on 4/14/17.
//  Copyright © 2017 Christopher Schlitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    /* Views */
    var bottomView = UIView()
    var leftView = UIView()
    var rightView = UIView()
    
    /* Layout Constraints */
    var bottomViewHeightConstraint = NSLayoutConstraint()
    var bottomViewWidthConstraint = NSLayoutConstraint()
    var leftViewHeightConstraint = NSLayoutConstraint()
    var leftViewWidthConstraint = NSLayoutConstraint()
    var rightViewHeightConstraint = NSLayoutConstraint()
    var rightViewWidthConstraint = NSLayoutConstraint()
    var leftViewTopConstraint = NSLayoutConstraint()
    var rightViewTopConstraint = NSLayoutConstraint()
    var bottomViewTopConstraint = NSLayoutConstraint()
    var bottomViewCenterConstraint = NSLayoutConstraint()
    var leftViewTrailingConstraint = NSLayoutConstraint()
    var rightViewLeadingConstraint = NSLayoutConstraint()
    
    /* Layout Constraints used for Animations */
    var bottomViewCenteredConstraint = NSLayoutConstraint()
    var leftViewCenteredConstraint = NSLayoutConstraint()
    var rightViewCenteredConstraint = NSLayoutConstraint()
    
    /* Tap Gesture Recognizer Methods */
    func toggleBottom(){
        UIView.animate(withDuration: 0.25, animations: {
            if(self.bottomViewTopConstraint.isActive){
                self.bottomViewTopConstraint.isActive = false
                NSLayoutConstraint.activate([self.bottomViewCenteredConstraint])
            } else {
                self.bottomViewCenteredConstraint.isActive = false
                NSLayoutConstraint.activate([self.bottomViewTopConstraint])
            }
            self.view.layoutIfNeeded()
        })
    }
    
    func toggleLeft(){
        UIView.animate(withDuration: 0.25, animations: {
            if(self.leftViewTrailingConstraint.isActive){
                self.leftViewTrailingConstraint.isActive = false
                NSLayoutConstraint.activate([self.leftViewCenteredConstraint])
            } else {
                self.leftViewCenteredConstraint.isActive = false
                NSLayoutConstraint.activate([self.leftViewTrailingConstraint])
            }
            self.view.layoutIfNeeded()
        })
    }
    
    func toggleRight(){
        UIView.animate(withDuration: 0.25, animations: {
            if(self.rightViewLeadingConstraint.isActive){
                self.rightViewLeadingConstraint.isActive = false
                NSLayoutConstraint.activate([self.rightViewCenteredConstraint])
            } else {
                self.rightViewCenteredConstraint.isActive = false
                NSLayoutConstraint.activate([self.rightViewLeadingConstraint])
            }
            self.view.layoutIfNeeded()
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the bottom view
        self.bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.bottomView.layer.cornerRadius = 10
        self.bottomView.clipsToBounds = true
        self.bottomView.backgroundColor = UIColor.orange
        
        // Create the left view
        self.leftView.translatesAutoresizingMaskIntoConstraints = false
        self.leftView.layer.cornerRadius = 10
        self.leftView.clipsToBounds = true
        self.leftView.backgroundColor = UIColor.blue
        
        // Create the right view
        self.rightView.translatesAutoresizingMaskIntoConstraints = false
        self.rightView.layer.cornerRadius = 10
        self.rightView.clipsToBounds = true
        self.rightView.backgroundColor = UIColor.red
        
        // Add the views to the window
        self.view.addSubview(self.bottomView)
        self.view.addSubview(self.leftView)
        self.view.addSubview(self.rightView)
        
        // Create the size constraints
        self.bottomViewHeightConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: -100.0)
        self.bottomViewWidthConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: -100.0)
        
        self.leftViewHeightConstraint = NSLayoutConstraint(item: self.leftView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: -100.0)
        self.leftViewWidthConstraint = NSLayoutConstraint(item: self.leftView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: -100.0)
        
        self.rightViewHeightConstraint = NSLayoutConstraint(item: self.rightView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: -100.0)
        self.rightViewWidthConstraint = NSLayoutConstraint(item: self.rightView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: -100.0)
        
        // Vertical Positional Constraints
        self.leftViewTopConstraint = NSLayoutConstraint(item: self.leftView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50.0)
        self.rightViewTopConstraint = NSLayoutConstraint(item: self.rightView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50.0)
        self.bottomViewTopConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -50.0)
        
        // Horizontal Positional Constraints
        self.bottomViewCenterConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        self.leftViewTrailingConstraint = NSLayoutConstraint(item: self.leftView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 50.0)
        self.rightViewLeadingConstraint = NSLayoutConstraint(item: self.rightView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -50.0)
        
        // Activate the constraints
        NSLayoutConstraint.activate([self.bottomViewHeightConstraint, self.bottomViewWidthConstraint, self.leftViewHeightConstraint, self.leftViewWidthConstraint, self.rightViewHeightConstraint, self.rightViewWidthConstraint, self.leftViewTopConstraint, self.rightViewTopConstraint, self.bottomViewTopConstraint, self.bottomViewCenterConstraint, self.leftViewTrailingConstraint, self.rightViewLeadingConstraint])
        
        // Inactive Animation Constraints
        self.bottomViewCenteredConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        self.leftViewCenteredConstraint = NSLayoutConstraint(item: self.leftView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        self.rightViewCenteredConstraint = NSLayoutConstraint(item: self.rightView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        
        // Add the gesture recognizers
        let bottomViewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleBottom))
        bottomViewTapRecognizer.delegate = self
        self.bottomView.addGestureRecognizer(bottomViewTapRecognizer)
        
        let leftViewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleLeft))
        leftViewTapRecognizer.delegate = self
        self.leftView.addGestureRecognizer(leftViewTapRecognizer)
        
        let rightViewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleRight))
        rightViewTapRecognizer.delegate = self
        self.rightView.addGestureRecognizer(rightViewTapRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

