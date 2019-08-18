//
//  numberMemoryController.swift
//  BrainBenchmark
//
//  Created by Sri Julapally on 8/14/19.
//  Copyright © 2019 Sri Julapally. All rights reserved.
//

import Foundation
import UIKit




class numberMemoryController: UIViewController{
    
    var didBegin: Bool! = false
    
    func randomNumbersMaker()-> Int{
        var lowerBound: Int = 1
        var upperBound: Int = 9
        var failed = false
        var highestNumber: Int = 8
        var randomInt: Int = 1
        
        while failed != true {
            var numberOfDigits = 1
            print("There are \(numberOfDigits) digits")
            randomInt = Int.random(in: lowerBound..<upperBound)
            print(randomInt)
            lowerBound*=10
            upperBound*=10
            numberOfDigits+=1
            /*
             Pseudocode:
             if inputNumber != randomInt{
                failed = true
             print to screen: "You got to \(numberOfDigits)"
             display: Start Over Button which will reset it
             }
            */
        }
        return randomInt
    }
    
    let randomNumbers: UILabel = {
        let numbers = UILabel()
        var lowerBound: Int = 1
        var upperBound: Int = 9
        var failed: Bool = false
        var randomInt = Int.random(in: lowerBound..<upperBound)
        
        numbers.text = String(randomInt)
        numbers.textColor = .green
        numbers.font = UIFont(name: "SF Pro Rounded", size: 30)

        return numbers
    }()
    
    let activityTitle: UILabel = {
        let title = UILabel()
        title.text = "Number Memory"
        title.font = UIFont(name: "SF Pro Rounded", size: 30)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        let attributedString = NSMutableAttributedString.init(string: "Number Memory")
        
        //ADDS AN UNDERLINE
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        title.attributedText = attributedString
        return title
    }()
    
    let activityDescription: UILabel = {
        let description = UILabel()
        description.text = "Increasingly larger numbers will be shown on screen and will go away after a short amount of time. Type the number once it disappears."
        description.font = UIFont(name: "SF Pro Rounded", size: 22)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .center
        description.textColor = .white
        description.numberOfLines = 0
        
        return description
    }()
    
    let beginButton: UIButton = {
        let begin = UIButton(type: .system)
        begin.setTitle("Begin", for: .normal)
        begin.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        begin.titleLabel?.font = UIFont(name: "SF Pro Rounded", size: 24)
        begin.setTitleColor(UIColor.white, for: .normal)
        begin.translatesAutoresizingMaskIntoConstraints = false
        begin.backgroundColor = UIColor(hue: 0.267, saturation: 0.223, brightness: 0.85, alpha: 0.76)
        begin.layer.cornerRadius = 30
        begin.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        begin.addTarget(self, action: #selector(beginActivity), for: .touchUpInside)
        
        return begin
    }()
    
    @objc func beginActivity(){
        beginButton.removeFromSuperview()
        view.addSubview(randomNumbers)
        randomNumbers.anchor(top: activityDescription.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        randomNumbers.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        print("added randomNumbers")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    func configureViewComponents(){
        assignbackground()
        view.addSubview(activityTitle)
        activityTitle.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        activityTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(activityDescription)
        activityDescription.anchor(top: activityTitle.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        activityDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(beginButton)
        beginButton.anchor(top: activityDescription.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        beginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

       
        //randomNumbers.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       /*
        randomNumbers.isHidden = true
        if didBegin == true{
            print("didBegin is true")
            randomNumbers.isHidden = false
        }
*/
        
        
        
    }
    
}
