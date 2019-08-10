//
//  AboutViewController.swift
//  BrainBenchmark
//
//  Created by Sri Julapally on 8/10/19.
//  Copyright © 2019 Sri Julapally. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {
    
    func assignbackground(){
        let background = UIImage(named: "GradientBackground")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
   
    
    
    let aboutLabel: UILabel = {
        let aboutText = UILabel()
        aboutText.text = "About"
        aboutText.font = UIFont(name: "SF Pro Rounded", size: 30)
        aboutText.textColor = .white
        return aboutText
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        print("About Loaded")
    }
    
    
    func configureViewComponents(){
        assignbackground()
        
        view.addSubview(aboutLabel)
        aboutLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
