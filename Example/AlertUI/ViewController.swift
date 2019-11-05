//
//  ViewController.swift
//  AlertUI
//
//  Created by farisalbalawi on 11/05/2019.
//  Copyright (c) 2019 farisalbalawi. All rights reserved.
//

import UIKit
import AlertUI

class ViewController: UIViewController {

     let example_Button: UIButton = {
        let Button  = UIButton()
        Button.setTitle("Example 1", for: .normal)
        Button.setTitleColor(.red, for: .normal)
        Button.backgroundColor = UIColor.clear
        Button.layer.borderWidth = 1
        Button.layer.borderColor = UIColor.red.cgColor
        Button.layer.cornerRadius = 50 / 2
        Button.tag = 0
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.addTarget(self, action:#selector(didPressButton(_:)), for: UIControl.Event.touchUpInside)
        return Button
    }()
    
     let exampl2_Button: UIButton = {
        let Button  = UIButton()
        Button.setTitle("Example 2", for: .normal)
        Button.setTitleColor(.red, for: .normal)
        Button.backgroundColor = UIColor.clear
        Button.layer.borderWidth = 1
        Button.layer.borderColor = UIColor.red.cgColor
        Button.layer.cornerRadius = 50 / 2
        Button.tag = 1
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.addTarget(self, action:#selector(didPressButton(_:)), for: UIControl.Event.touchUpInside)
        return Button
    }()
    
     let exampl3_Button: UIButton = {
        let Button  = UIButton()
        Button.setTitle("Example 3", for: .normal)
        Button.setTitleColor(.red, for: .normal)
        Button.backgroundColor = UIColor.clear
        Button.layer.borderWidth = 1
        Button.layer.borderColor = UIColor.red.cgColor
        Button.layer.cornerRadius = 50 / 2
        Button.tag = 2
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.addTarget(self, action:#selector(didPressButton(_:)), for: UIControl.Event.touchUpInside)
        return Button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(example_Button)
        view.addSubview(exampl2_Button)
         view.addSubview(exampl3_Button)
        NSLayoutConstraint.activate([
         
            self.example_Button.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.3),
            self.example_Button.heightAnchor.constraint(equalToConstant: 50),
            self.example_Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            self.example_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.exampl2_Button.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.3),
            self.exampl2_Button.heightAnchor.constraint(equalToConstant: 50),
            self.exampl2_Button.topAnchor.constraint(equalTo: example_Button.bottomAnchor,constant: 20),
            self.exampl2_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.exampl3_Button.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.3),
            self.exampl3_Button.heightAnchor.constraint(equalToConstant: 50),
            self.exampl3_Button.topAnchor.constraint(equalTo: exampl2_Button.bottomAnchor,constant: 20),
            self.exampl3_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
         ])
        
    }
    
    @objc func didPressButton(_ sender: UIButton) {
        if sender.tag == 0 {
             example1()
        } else if sender.tag == 1 {
             example2()
        } else {
             example3()
        }
        

       

    }

    
    
    func example1() {
        let Follow : [String: () -> Void] = [ "Follow":  {
                print("tapped Follow")
         }]
        
        let Notification : [String: () -> Void] = [ "Notification":  {
                print("tapped Notification")
         }]
        
        let Block : [String: () -> Void] = [ "Block":  {
                      print("tapped Block")
            }]
        
        let arrayActions = [
            AlertAction(buttonAction: Follow, buttonColor: UIColor.black, imageName: "follow", imageColor: UIColor.black),
            AlertAction(buttonAction: Notification, buttonColor: UIColor.black, imageName: "notification", imageColor: UIColor.black),
            AlertAction(buttonAction: Block, buttonColor: UIColor.red, imageName: "block", imageColor: UIColor.red),
        ]
        
        let imageAvatar = UIImage(named: "avatar")
        
        self.showAlertControllerOptions(
        icons: imageAvatar,
        title: "Faris Albalawi",
        titleColor: UIColor.black,
        messageColor: nil,
        message:nil,
        backgroundColor:nil,
        lineColor: nil,
        DismissTitle: nil,
        DismissColor: nil,
        DismissTitleColor: nil,
        actions: arrayActions)
    }
    
    
    
    func example2() {
        let Follow : [String: () -> Void] = [ "Follow":  {
                print("tapped Follow")
         }]

         let arrayActions = [
            AlertActionButtons(buttonAction: Follow, titleColor: UIColor.white, backgroundColor: UIColor.red, borderColor: nil, borderWidth: nil),
         
        ]
        
        let imageAvatar = UIImage(named: "avatar")
        self.ShowAlertControllerButtons(icons: imageAvatar,
        title: "Faris Albalawi",
        titleColor: nil,
        messageColor: nil,
        message:nil,
        backgroundColor:nil,
        lineColor: nil,
        DismissTitle: nil,
        DismissColor: nil,
        DismissTitleColor: nil,
        actions: arrayActions)
        
    }
    
    
    func example3() {
        let image = UIImage(named: "ok")
        self.showAlert(icons: image,
        title: "Done",
        titleColor: nil,
        messageColor: UIColor.lightGray,
        message:"Your project was successfully saved!",
        backgroundColor:nil,
        DismissTitle: "Ok",
        DismissColor: nil,
        DismissTitleColor: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



enum color {

    static let lightGray = UIColor(red: 0.9412, green: 0.9412, blue: 0.9451, alpha: 1.0)
  

    
}
