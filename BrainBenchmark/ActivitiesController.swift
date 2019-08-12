//
//  ActivitesController.swift
//  BrainBenchmark
//

//  Created by Sri Julapally on 8/11/19.
//  Copyright © 2019 Sri Julapally. All rights reserved.
//

import UIKit

class activitiesController: UIViewController{
    
   
    
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
    
    let numberMemoryButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let numberMemory = UIButton(type: .system)
        numberMemory.setTitle("Number Memory", for: .normal)
        numberMemory.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        numberMemory.backgroundColor = UIColor.white
        
        return numberMemory
        }()
    
    let reactionTimeButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let reactiontime = UIButton(type: .system)
        reactiontime.setTitle("Reaction Time", for: .normal)
        reactiontime.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        reactiontime.backgroundColor = UIColor.white
        
        return reactiontime
    }()
    
    let verbalMemoryButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let verbalMemory = UIButton(type: .system)
        verbalMemory.setTitle("Reaction Time", for: .normal)
        verbalMemory.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        verbalMemory.backgroundColor = UIColor.white
        
        return verbalMemory
    }()

    lazy var leftColumn: UIStackView = {
        let leftStack =  UIStackView(arrangedSubviews: [numberMemoryButton, reactionTimeButton, verbalMemoryButton])
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        leftStack.axis = .vertical
        leftStack.spacing = 10
        leftStack.distribution = .fillEqually
        
        
        return leftStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        print("Loaded Activities Page")
    }
    
    
    
    func configureViewComponents(){
    
        assignbackground()
        
        /*
        view.addSubview(numberMemoryButton)
        numberMemoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberMemoryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        */
        view.addSubview(leftColumn)
    }
    
}
