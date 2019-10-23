//
//  hearingController.swift
//  BrainBenchmark
//
//  Created by Sri Julapally on 8/14/19.
//  Copyright © 2019 Sri Julapally. All rights reserved.
//

import Foundation
import UIKit
import FlatUIKit
import SkyFloatingLabelTextField
import AudioKit
import AudioKitUI
import CoreAudioKit

class hearingController: UIViewController{
    
    var oscillator: AKOscillator!
    var filter: AKLowPassFilter!
    var envelope: AKAmplitudeEnvelope!
    
    let activityTitle: UILabel = {
        let title = UILabel()
        title.text = "Number Memory"
        title.font = UIFont.init(name: "Lato-Italic", size: 30)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        let attributedString = NSMutableAttributedString.init(string: "Hearing Test")
        
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
        description.text = "Click the button as soon as you hear the sound."
        description.font = UIFont.init(name: "Lato-Regular", size: 22)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .center
        description.textColor = .white
        description.numberOfLines = 0
        
        return description
    }()
    
    
    let headphoneAlert: UIAlertController = {
        let alertView = UIAlertController(title: "Alert:", message: "Headphones are strongly recommended for this section.", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "I understand", style: .default))
        

        return alertView
    }()
    
    let hearButton: FUIButton = {
        let hear = FUIButton(type: .system)
        hear.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        hear.setTitle("I hear the sound", for: .normal)
        hear.buttonColor = UIColor.turquoise()
        hear.shadowColor = UIColor.greenSea()
        hear.shadowHeight = 3.0
        hear.cornerRadius = 6.0
        hear.titleLabel?.font = UIFont.init(name: "Lato-Regular", size: 24)
        hear.setTitleColor(UIColor.clouds(), for: .normal)
        hear.setTitleColor(UIColor.clouds(), for: .highlighted)
        hear.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        //hear.addTarget(self, action: #selector(aboutButtonPush), for: .touchUpInside)
    
        return hear
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        
        //configureViewComponents()
        // other stuff goes here
    }
    
   
    
    func configureViewComponents(){
        assignbackground()
        self.present(headphoneAlert, animated: true, completion: nil)
        
        view.addSubview(activityTitle)
        activityTitle.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 48, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        activityTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(activityDescription)
        activityDescription.anchor(top: activityTitle.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)
        activityDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(hearButton)
        hearButton.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        hearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hearButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
