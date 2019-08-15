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
    
    let activitiesTitle: UILabel = {
        let testYourBrain = UILabel()
        testYourBrain.text = "Test Your Brain"
        testYourBrain.font = UIFont(name: "SF Pro Rounded", size: 36)
        let attributedString = NSMutableAttributedString.init(string: "Test Your Brain")
        testYourBrain.textColor = .white
        
        //ADDS AN UNDERLINE
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        testYourBrain.attributedText = attributedString
        return testYourBrain
    }()
    
    let backButton: UIButton = {
        let back = UIButton()
        let backIcon = UIImage(named: "backIcon")
        
        back.setImage(backIcon, for: .normal)
        back.addTarget(self, action: #selector(backToHomepage), for: .touchUpInside)
        return back
    }()
    
    func setBackButton(){
        
        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIcon"), style: .plain, target: nil, action: #selector(backToHomepage))
    }
    
    @objc func backToHomepage() {
        navigationController?.popViewController(animated: true)
        print("Popped View to homepage")
    }
    
    //ACTIVITIES ON LEFT SIDE OF SCREEN STACKVIEW
    lazy var leftColumn: UIStackView = {
        let leftStack =  UIStackView(arrangedSubviews: [numberMemoryButton, reactionTimeButton, verbalMemoryButton])
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        leftStack.axis = .vertical
        leftStack.spacing = 10
        leftStack.distribution = .fillEqually
        
        
        return leftStack
    }()
    
    let numberMemoryButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let numberMemory = UIButton(type: .system)
        numberMemory.setTitle("Number Memory", for: .normal)
        //numberMemory.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        numberMemory.backgroundColor = UIColor.white
        
        return numberMemory
        }()
    
    let reactionTimeButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let reactiontime = UIButton(type: .system)
        reactiontime.setTitle("Reaction Time", for: .normal)
        //reactiontime.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        reactiontime.backgroundColor = UIColor.white
        
        return reactiontime
    }()
    
    let verbalMemoryButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let verbalMemory = UIButton(type: .system)
        verbalMemory.setTitle("Verbal Memory", for: .normal)
        //verbalMemory.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        verbalMemory.backgroundColor = UIColor.white
        
        return verbalMemory
    }()

    //ACTIVITIES ON RIGHT SIDE OF SCREEN STACKVIEW
    lazy var rightColumn: UIStackView = {
        let rightStack =  UIStackView(arrangedSubviews: [visualMemoryButton, hearingButton, typingButton])
        rightStack.translatesAutoresizingMaskIntoConstraints = false
        rightStack.axis = .vertical
        rightStack.spacing = 10
        rightStack.distribution = .fillEqually
        
        
        return rightStack
    }()
    
    let visualMemoryButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let visualMemory = UIButton(type: .system)
        visualMemory.setTitle("Visual Memory", for: .normal)
        //verbalMemory.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        visualMemory.backgroundColor = UIColor.white
        
        return visualMemory
    }()
    
    let hearingButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let hearing = UIButton(type: .system)
        hearing.setTitle("Hearing", for: .normal)
        //verbalMemory.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        hearing.backgroundColor = UIColor.white
        
        return hearing
    }()
    
    let typingButton: UIButton = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let typing = UIButton(type: .system)
        typing.setTitle("Typing", for: .normal)
        //verbalMemory.frame = CGRect(x: 0, y: 0, width: (screenSize.width/2)-(screenSize.width/20), height: (screenSize.height/3)-(screenSize.width/30))
        typing.backgroundColor = UIColor.white
        
        return typing
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        print("Loaded Activities Page")
    }
    
    
    
    func configureViewComponents(){
    
        assignbackground()
        setBackButton()
        
        view.addSubview(activitiesTitle)
        activitiesTitle.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        activitiesTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(leftColumn)
        leftColumn.anchor(top: activitiesTitle.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.centerXAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        
        view.addSubview(rightColumn)
        rightColumn.anchor(top: activitiesTitle.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        //view.addSubview(backButton)
       
        
        
        /*
        view.addSubview(numberMemoryButton)
        numberMemoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numberMemoryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        */
        
    }
    
}
