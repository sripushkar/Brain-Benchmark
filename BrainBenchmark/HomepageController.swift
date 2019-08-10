//
//  ViewController.swift
//  BrainBenchmark
//
//  Created by Sri Julapally on 8/8/19.
//  Copyright © 2019 Sri Julapally. All rights reserved.
//
import UIKit

class ViewController: UIViewController{
    var gradientLayer: CAGradientLayer!
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(hue: 0.519, saturation: 0.491, brightness: 1, alpha: 0.5).cgColor, UIColor(hue: 0.772, saturation: 0.538, brightness: 0.914, alpha: 0.5).cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        //SETS LOGO IMAGE
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    let welcomeToBrainBenchmark: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to Brain Benchmark"
        welcomeLabel.font = UIFont(name: "SF Pro Rounded", size: 30)
        welcomeLabel.textColor = .white
        return welcomeLabel
    }()
    
    let getStartedButton: UIButton = {
        let getStarted = UIButton(type: .system)
        getStarted.setTitle("Get Started", for: .normal)
        getStarted.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        
        getStarted.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 24)
        getStarted.setTitleColor(UIColor.white, for: .normal)
        
        getStarted.backgroundColor = UIColor(hue: 0.265, saturation: 0.226, brightness: 0.851, alpha: 0.76)
        getStarted.layer.cornerRadius = 30
        getStarted.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        //getStarted.addTarget(self, action: #selector(handleCreateEvent), for: .touchUpInside)
        return getStarted
    }()
    
    let aboutButton: UIButton = {
        let about = UIButton(type: .system)
        about.setTitle("About", for: .normal)
        about.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        about.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 24)
        about.setTitleColor(UIColor.white, for: .normal)
        
        about.backgroundColor = UIColor(hue: 0.267, saturation: 0.223, brightness: 0.85, alpha: 0.76)
        about.layer.cornerRadius = 30
        about.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        //about.addTarget(self, action: #selector(aboutButtonPush), for: .touchUpInside)
        return about
    }()
    
    //@objc func aboutButtonPush() {
    //navigationController?.pushViewController(AboutViewController(), animated: true)
    // }
    
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
        print("Loaded")
    }
    
func configureViewComponents(){
    //ADDS THE GRADIENT BACKGROUND
    createGradientLayer()
    
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



