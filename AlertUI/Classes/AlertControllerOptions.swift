//
//  AlertControllerOptions.swift
//  AlertUI
//
//  Created by Faris Albalawi on 11/5/19.
//

import UIKit

public struct AlertAction {
     let buttonAction: [String: () -> Void]
     let buttonColor: UIColor
     let imageName: String?
     let imageColor: UIColor?
    
    public init(buttonAction:[String: () -> Void], buttonColor: UIColor, imageName:String? ,imageColor:UIColor? ){
        self.buttonAction = buttonAction
        self.buttonColor = buttonColor
        self.imageName = imageName
        self.imageColor = imageColor
    }
    
}


class AlertControllerOptions: UIViewController {

    
   private var AlertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
  private  var AlertMassage: UILabel = {
        let message = UILabel()
        message.numberOfLines = 0
        message.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        message.textAlignment = .center
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    
   private var AlertTitle: UILabel = {
        let Title = UILabel()
        Title.numberOfLines = 0
        Title.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.black)
        Title.textAlignment = .center
        Title.translatesAutoresizingMaskIntoConstraints = false
        return Title
    }()
    
   private var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
   private var ActionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private var IconsStackView: UIStackView = {
         let stackView = UIStackView()
         stackView.backgroundColor = .clear
         stackView.alignment = .center
         stackView.axis = .vertical
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.isLayoutMarginsRelativeArrangement = true
         return stackView
     }()
    
   private var buttonDismiss: UIButton = {
        let Button  = UIButton()
        Button.setTitle("Cancel", for: .normal)
        Button.setTitleColor(.black, for: .normal)
        Button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.black)
        Button.backgroundColor = UIColor(red: 0.9412, green: 0.9412, blue: 0.9451, alpha: 1.0)
        Button.layer.borderColor = UIColor(red: 0.9412, green: 0.9412, blue: 0.9451, alpha: 1.0).cgColor
        Button.layer.borderWidth = 3
        Button.layer.cornerRadius = 22.5
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.addTarget(self, action:#selector(didPressCancelButton(_:)), for: UIControl.Event.touchUpInside)
        return Button
    }()

    
   private var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.9412, green: 0.9412, blue: 0.9451, alpha: 1.0)
        view.layer.cornerRadius = 0
        view.layer.masksToBounds = true
        return view
    }()
    
    
    
    // MARK: variables
    var Message: String?
    var MessageColor: UIColor?
    var Title: String?
    var TitleColor: UIColor?
    var DismissTitle: String?
    var DismissColor: UIColor?
    var DismissTitleColor: UIColor?
    var icons: UIImage?
    var ArrayAction: [AlertAction]?
    var backgroundColor: UIColor?
    var lineColor: UIColor?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Subview
        self.view.addSubview(AlertView)
        self.AlertView.addSubview(buttonDismiss)
        self.AlertView.addSubview(ActionStackView)
        self.AlertView.addSubview(IconsStackView)
        self.AlertView.addSubview(lineView)
        self.AlertView.addSubview(textStackView)
    
        
        self.textStackView.addArrangedSubview(AlertTitle)
        self.textStackView.addArrangedSubview(AlertMassage)
        self.textStackView.setCustomSpacing(5, after: AlertTitle)
        
        // MARK: Layout
        NSLayoutConstraint.activate([
            self.AlertView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            self.AlertView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.AlertView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                

            
          
            self.IconsStackView.topAnchor.constraint(equalTo: self.AlertView.topAnchor,constant: 10),
            self.IconsStackView.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor),
            self.IconsStackView.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor),
         
            

                       
            self.textStackView.topAnchor.constraint(equalTo: self.IconsStackView.bottomAnchor,constant: 10),
            self.textStackView.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor),
            self.textStackView.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor),
                    
            self.lineView.heightAnchor.constraint(equalToConstant: 1),
            self.lineView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            self.lineView.topAnchor.constraint(equalTo: self.textStackView.bottomAnchor,constant: 5),
            self.lineView.centerXAnchor.constraint(equalTo: self.AlertView.centerXAnchor),
         
            self.ActionStackView.topAnchor.constraint(equalTo: self.lineView.bottomAnchor,constant: 15),
            self.ActionStackView.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor),
            self.ActionStackView.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor),
            self.ActionStackView.bottomAnchor.constraint(equalTo: self.buttonDismiss.topAnchor,constant: -20),
                    
            self.buttonDismiss.heightAnchor.constraint(equalToConstant: 50),
            self.buttonDismiss.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor,constant: -15),
            self.buttonDismiss.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor,constant: 15),
            self.buttonDismiss.bottomAnchor.constraint(equalTo: self.AlertView.bottomAnchor,constant: -25),
        ])
        
        
        // MARK: CALL FUNC
        self.setUpIcons()
        self.setView()
        self.setUpCancelDismiss()
        self.setUpButton()
        self.setUpTitle()
        
        
    }
    
    // MARK: SET VIEW
    func setView() {
        if backgroundColor != nil {
            self.AlertView.backgroundColor = backgroundColor!
        }
        
        if lineColor != nil {
            lineView.backgroundColor = lineColor!
        }
        
    }
    
    // MARK: SET UP ICONS IMAGE
    func setUpIcons() {
        if icons != nil {
            let iconsImage = UIImageView(image: icons!)
            iconsImage.backgroundColor = .clear
            iconsImage.layer.cornerRadius = 25
            iconsImage.layer.masksToBounds = true
            iconsImage.translatesAutoresizingMaskIntoConstraints = false
            iconsImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
            iconsImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
            self.IconsStackView.addArrangedSubview(iconsImage)
        }
    }
    
    
    // MARK: SET UP DISMISS BUTTON
    func setUpCancelDismiss() {
        if DismissTitle != nil {
            buttonDismiss.setTitle(DismissTitle!, for: .selected)
        }
        
        if DismissTitleColor != nil {
            buttonDismiss.setTitleColor(DismissTitleColor!, for: .normal)
        }
        
        if DismissColor != nil {
            buttonDismiss.backgroundColor = DismissColor!
        } else if DismissTitleColor != nil {
            buttonDismiss.layer.borderColor = DismissTitleColor!.cgColor
        }
    }
    
    
    // MARK: SET UP TITLE AND MESSAGE
    func setUpTitle(){
        if Message == nil {
            self.AlertMassage.isHidden = true
        } else {
            self.AlertMassage.isHidden = false
            self.AlertMassage.text = Message
            if MessageColor != nil {
                AlertMassage.textColor = MessageColor!
            }
        }
        if Title == nil {
           self.AlertTitle.isHidden = true
        } else {
            self.AlertTitle.text = Title
            self.AlertTitle.isHidden = false
            if TitleColor != nil {
                AlertTitle.textColor = TitleColor!
            }
        }
        
        if Message == nil && Title == nil {
            self.lineView.isHidden = true
            self.lineView.isHidden = true
        }
    }

    // MARK: SET UP BUTTON
    func setUpButton() {
        var count = 0
        if ArrayAction != nil {
            for i in ArrayAction! {
                // MARK: SET BUTTON
                let allKeys = Array(i.buttonAction.keys)
                let buttonTitle: String = allKeys[0]
                let Button = UIButton()
                Button.setTitle(buttonTitle, for: .normal)
                Button.setTitleColor(i.buttonColor, for: .normal)
                Button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
                Button.backgroundColor = UIColor.clear
                Button.translatesAutoresizingMaskIntoConstraints = false
                Button.addTarget(self, action:#selector(didPressButton(_:)), for: UIControl.Event.touchUpInside)
                Button.tag = count
                Button.contentHorizontalAlignment = .left
              
                // MARK: SET IMAGE
                var image = UIImageView()
                image.translatesAutoresizingMaskIntoConstraints = false
                
                
                // MARK: SET UP STACK VIRE OF BUTTOM
                let stackView = UIStackView()
                stackView.backgroundColor = .clear
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.axis = .horizontal
                stackView.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
                stackView.isLayoutMarginsRelativeArrangement = true
                
                
                
                
                if i.imageName != nil {
                    let imageName = UIImage(named: "\(i.imageName!)")?.withRenderingMode(.alwaysTemplate)
                    image = UIImageView(image: imageName)
                    stackView.addArrangedSubview(image)
                    image.widthAnchor.constraint(equalToConstant: 25).isActive = true
                    image.heightAnchor.constraint(equalToConstant: 25).isActive = true
                    stackView.setCustomSpacing(15, after: image)
                }
                
                if i.imageColor != nil {
                    image.tintColor = i.imageColor!
                }
                
                stackView.addArrangedSubview(Button)
           
              
                // MARK: ADD STATCK TO ActionStackView
                self.ActionStackView.addArrangedSubview(stackView)
                self.ActionStackView.setCustomSpacing(30, after: stackView)
                
            count += 1
                
            }
        }
    }
    
    
    
    
    // MARK: Button button
    @objc func didPressButton(_ sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
            if ArrayAction != nil {
            let dic = ArrayAction![sender.tag]
             for (_,value) in dic.buttonAction {
                 let action: () -> Void = value
                 action()
                self.dismiss(animated: true, completion: nil)
                }
            }
     }
    
    
    
    // MARK: Dismiss button
    @objc func didPressCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    
    }
    

}



public extension UIViewController {

    func showAlertControllerOptions(icons: UIImage?,
                                    title: String?,
                                    titleColor: UIColor?,
                                    messageColor: UIColor?,
                                    message:String?,
                                    backgroundColor:UIColor?,
                                    lineColor: UIColor?,
                                    DismissTitle: String?,
                                    DismissColor: UIColor?,
                                    DismissTitleColor: UIColor?,
                                    actions: [AlertAction]?) {
        let alertVC = AlertControllerOptions()
        alertVC.icons = icons
        alertVC.Title = title
        alertVC.TitleColor = titleColor
        alertVC.Message = message
        alertVC.MessageColor = messageColor
        alertVC.backgroundColor = backgroundColor
        alertVC.lineColor = lineColor
        alertVC.ArrayAction = actions
        alertVC.DismissTitle = DismissTitle
        alertVC.DismissColor = DismissColor
        alertVC.DismissTitleColor = DismissTitleColor
        alertVC.modalTransitionStyle = .coverVertical
        alertVC.modalPresentationStyle = .popover
        self.present(alertVC, animated: true, completion: nil)
        
        
    }

}
