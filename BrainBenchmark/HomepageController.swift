//
//  ViewController.swift
//  BrainBenchmark
//
//  Created by Sri Julapally on 8/8/19.
//  Copyright © 2019 Sri Julapally. All rights reserved.
//
import UIKit
import CoreText
import FlatUIKit

class homepageController: UIViewController{

    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        //SETS LOGO IMAGE
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    let welcomeToBrainBenchmark: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to Brain Benchmark"
        welcomeLabel.font = UIFont(name: "SF Pro Rounded", size: 30)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.textColor = .white
        let attributedString = NSMutableAttributedString.init(string: "Welcome to Brain Benchmark!")
        
        //ADDS AN UNDERLINE
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        welcomeLabel.attributedText = attributedString
        return welcomeLabel
    }()
    
    let getStartedButton: FUIButton = {
        let getStarted = FUIButton(type: .system)
        getStarted.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        getStarted.setTitle("Get Started", for: .normal)
        getStarted.buttonColor = UIColor.turquoise()
        getStarted.shadowColor = UIColor.greenSea()
        getStarted.shadowHeight = 3.0
        getStarted.cornerRadius = 6.0
        getStarted.titleLabel?.font = UIFont.init(name: "Lato-Regular.ttf", size: 24)
        getStarted.setTitleColor(UIColor.clouds(), for: .normal)
        getStarted.setTitleColor(UIColor.clouds(), for: .highlighted)
        getStarted.addTarget(self, action:#selector(activitiesButtonPush), for: .touchUpInside)
        /*
        getStarted.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 24)
        getStarted.setTitleColor(UIColor.white, for: .normal)
        getStarted.translatesAutoresizingMaskIntoConstraints = false
        getStarted.backgroundColor = UIColor(hue: 0.265, saturation: 0.226, brightness: 0.851, alpha: 0.76)
        getStarted.layer.cornerRadius = 30
        getStarted.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
 */
        return getStarted
    }()
    
    @objc func activitiesButtonPush() {
        navigationController?.pushViewController(activitiesController(), animated: true)
        print("Pushed view to activitiesController")
    }
    
    let aboutButton: UIButton = {
        let about = UIButton(type: .system)
        about.setTitle("About", for: .normal)
        about.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        about.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 24)
        about.setTitleColor(UIColor.white, for: .normal)
        about.translatesAutoresizingMaskIntoConstraints = false
        about.backgroundColor = UIColor(hue: 0.267, saturation: 0.223, brightness: 0.85, alpha: 0.76)
        about.layer.cornerRadius = 30
        about.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        about.addTarget(self, action: #selector(aboutButtonPush), for: .touchUpInside)
        
        return about
    }()
    
    
    
    @objc func aboutButtonPush() {
        navigationController?.pushViewController(aboutViewController(), animated: true)
        print("Pushed view to aboutViewController")
     }
    
    lazy var stackView: UIStackView = {
        let order =  UIStackView(arrangedSubviews: [getStartedButton,aboutButton])
        order.translatesAutoresizingMaskIntoConstraints = false
        order.axis = .vertical
        order.spacing = 15
        order.distribution = .fillEqually
        
        return order
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        print("Loaded Homepage")
    }
    
    
    
    
func configureViewComponents(){
    
    assignbackground()
    
    
    //AUTOLAYOUT FOR LOGO
    view.addSubview(logoImageView)
    logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
    logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    view.addSubview(welcomeToBrainBenchmark)
    welcomeToBrainBenchmark.anchor(top: logoImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
    welcomeToBrainBenchmark.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    view.addSubview(stackView)
    stackView.anchor(top: welcomeToBrainBenchmark.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    }
}



