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
        let abtLabel = UILabel()
        abtLabel.text = "About Brain Benchmark"
        abtLabel.font = UIFont(name: "SF Pro Rounded", size: 36)
        let attributedString = NSMutableAttributedString.init(string: "About Brain Benchmark")
        abtLabel.textColor = .white
        
        //ADDS AN UNDERLINE
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        abtLabel.attributedText = attributedString
        
        return abtLabel
    }()
    
    let aboutText: UILabel = {
        let abtText = UILabel()
        abtText.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        abtText.font = UIFont(name: "SF Pro Rounded", size: 24)
        abtText.textAlignment = .center
        abtText.textColor = .white
        abtText.numberOfLines = 0
        return abtText
    }()
    
    let backButton: UIButton = {
        let back = UIButton()
        back.setTitle("Back", for: .normal)
        back.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        
        back.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 24)
        back.setTitleColor(UIColor.white, for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.backgroundColor = UIColor(hue: 0.265, saturation: 0.226, brightness: 0.851, alpha: 0.76)
        back.layer.cornerRadius = 30
        back.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        back.addTarget(self, action: #selector(backToHomepage), for: .touchUpInside)
        return back
    }()
    
    @objc func backToHomepage() {
        navigationController?.popViewController(animated: true)
        print("Pushed view to aboutViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        print("About Loaded")
    }
    
    
    func configureViewComponents(){
        assignbackground()
        
        view.addSubview(aboutLabel)
        aboutLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(aboutText)
        aboutText.anchor(top: aboutLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        aboutText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(backButton)
        backButton.anchor(top: aboutText.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 0)
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
 
    }
}
