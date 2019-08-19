//
//  numberMemoryController.swift
//  BrainBenchmark
//
//  Created by Sri Julapally on 8/14/19.
//  Copyright © 2019 Sri Julapally. All rights reserved.
//
// 8/18/19, I HAVE FINISHED THE UI. I NEED TO ADD THE LOGIC AND ADD ALERT MESSAGES
//          IF THE USER TYPES A WRONG NUMBER. 



import Foundation
import UIKit
import FlatUIKit
import SkyFloatingLabelTextField

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
        numbers.textColor = .white
        numbers.font = UIFont.init(name: "Lato-Bold", size: 30)

        return numbers
    }()
    
    
    
    /*
    let enterNumber: FUITextField = {
        let enter = FUITextField()
        enter.font = UIFont.init(name: "Lato-Regular", size: 16)
        enter.backgroundColor = UIColor.white
        enter.borderColor = UIColor.turquoise()
        enter.edgeInsets = UIEdgeInsets(top: 4.0, left: 15.0, bottom: 4.0, right: 15.0)
        enter.keyboardType = UIKeyboardType.numberPad
        
        return enter
    }()
    */
    let activityTitle: UILabel = {
        let title = UILabel()
        title.text = "Number Memory"
        title.font = UIFont.init(name: "Lato-Italic", size: 30)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        let attributedString = NSMutableAttributedString.init(string: "Number Memory")
        
        //ADDS AN UNDERLINE
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        title.attributedText = attributedString
        return title
    }()
    
    let backButton: UIButton = {
        let back = UIButton()
        let backIcon = UIImage(named: "backIcon")
        
        back.setImage(backIcon, for: .normal)
        back.addTarget(self, action: #selector(backToActivities), for: .touchUpInside)
        return back
    }()
    
    
    @objc func backToActivities() {
        navigationController?.popViewController(animated: true)
        print("Popped View to activities")
    }
    
    let activityDescription: UILabel = {
        let description = UILabel()
        description.text = "Increasingly larger numbers will be shown on screen and will go away after a short amount of time. Type the number once it disappears."
        description.font = UIFont.init(name: "Lato-Regular", size: 22)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .center
        description.textColor = .white
        description.numberOfLines = 0
        
        return description
    }()
    
    let enterNumber: SkyFloatingLabelTextField = {
        let enter = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 125, height: 45))
        enter.placeholder = "Enter the number"
        enter.title = "Number:"
        enter.font = UIFont.init(name: "Lato-Regular", size: 16)
        enter.tintColor = UIColor.white
        enter.textColor = UIColor.white
        enter.lineColor = UIColor.white
        enter.selectedTitleColor = UIColor.turquoise()
        enter.selectedLineColor = UIColor.turquoise()
        enter.lineHeight = 1.0
        enter.selectedLineHeight = 2.0
        enter.keyboardType = UIKeyboardType.numberPad
        return enter
    }()
    
    let hiddenButton: UIButton = {
       let hidden = UIButton()
        hidden.isHidden = true
        return hidden
    }()
    
    let submitButton: FUIButton = {
        let submit = FUIButton(type: .system)
        submit.setTitle("Submit", for: .normal)
        submit.buttonColor = UIColor.turquoise()
        submit.shadowColor = UIColor.greenSea()
        submit.shadowHeight = 3.0
        submit.cornerRadius = 6.0
        submit.setTitleColor(.white, for: .normal)
        submit.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        submit.titleLabel?.font = UIFont(name: "Lato-Regular", size: 24)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.backgroundColor = UIColor(hue: 0.267, saturation: 0.223, brightness: 0.85, alpha: 0.76)
        submit.layer.cornerRadius = 30
        submit.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        //submit.addTarget(self, action: #selector(beginActivity), for: .touchUpInside)
        
        return submit
    }()
    
    let beginButton: FUIButton = {
        let begin = FUIButton(type: .system)
        begin.setTitle("Begin", for: .normal)
        begin.buttonColor = UIColor.turquoise()
        begin.shadowColor = UIColor.greenSea()
        begin.shadowHeight = 3.0
        begin.cornerRadius = 6.0
        begin.setTitleColor(.white, for: .normal)
        begin.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        begin.titleLabel?.font = UIFont(name: "Lato-Regular", size: 24)
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
        
        randomNumbers.fadeOut()
        
        view.addSubview(enterNumber)
        enterNumber.alpha = 0.0
        enterNumber.anchor(top: hiddenButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        enterNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterNumber.fadeIn()
        
        view.addSubview(submitButton)
         submitButton.anchor(top: enterNumber.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
         submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.alpha = 0.0
        submitButton.fadeIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    func configureViewComponents(){
        assignbackground()
        view.addSubview(activityTitle)
        activityTitle.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 48, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        activityTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(activityDescription)
        activityDescription.anchor(top: activityTitle.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)
        activityDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(beginButton)
        beginButton.anchor(top: activityDescription.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        beginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(hiddenButton)
        hiddenButton.anchor(top: activityDescription.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        hiddenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        

       
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
