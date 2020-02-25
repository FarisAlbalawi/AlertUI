//
//  AlertControllerButtons.swift
//  AlertUI
//
//  Created by Faris Albalawi on 11/5/19.
//

import UIKit


public struct AlertActionButtons {
     let buttonAction: [String: () -> Void]
     let titleColor: UIColor?
     let backgroundColor: UIColor?
     let borderColor: UIColor?
     let borderWidth: CGFloat?
    
    public init(buttonAction:[String: () -> Void],
                titleColor:UIColor,
                backgroundColor:UIColor?,
                borderColor:UIColor?,
                borderWidth:CGFloat?
                ){
        self.buttonAction = buttonAction
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
    
}

class AlertControllerButtons: UIViewController {

     private var AlertView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.backgroundColor = .white
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
          Button.layer.cornerRadius = 25
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
    var ArrayButtons: [AlertActionButtons]?
    var backgroundColor: UIColor?
    var lineColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // MARK: Subview
           self.AlertView.layer.cornerRadius = 20
           self.AlertView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
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
             
                self.ActionStackView.topAnchor.constraint(equalTo: self.lineView.bottomAnchor,constant: 5),
                self.ActionStackView.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor),
                self.ActionStackView.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor),
                self.ActionStackView.bottomAnchor.constraint(equalTo: self.buttonDismiss.topAnchor,constant: -10),
                        
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
        
        if let first = self.presentingViewController {
            let background = UIView()
            background.alpha = 0
            background.tag = 100
            first.view.addSubview(background)
            background.frame = first.view.frame
            background.backgroundColor = .black
            UIView.animate(withDuration: 0.5, animations: {
                background.alpha = 0.5
            })
        }
        
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
        if ArrayButtons != nil {
            for i in ArrayButtons! {
                // MARK: SET BUTTON
                let allKeys = Array(i.buttonAction.keys)
                let buttonTitle: String = allKeys[0]
                let Button = UIButton()
                Button.setTitle(buttonTitle, for: .normal)
                Button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
                Button.translatesAutoresizingMaskIntoConstraints = false
                Button.addTarget(self, action:#selector(didPressButton(_:)), for: UIControl.Event.touchUpInside)
                Button.tag = count
                Button.contentHorizontalAlignment = .center
               
                Button.layer.borderWidth = 3
                Button.layer.cornerRadius = 22.5
                
                if i.titleColor != nil {
                     Button.setTitleColor(i.titleColor, for: .normal)
                } else {
                    Button.setTitleColor(UIColor.black, for: .normal)
                }
                
                if i.backgroundColor != nil {
                      Button.backgroundColor = i.backgroundColor
                } else {
                      Button.backgroundColor = UIColor.clear
                }
                
                if i.borderColor != nil {
                    Button.layer.borderColor = i.borderColor!.cgColor
                } else {
                    Button.layer.borderColor = UIColor.clear.cgColor
                }
                
                if i.borderWidth != nil {
                    Button.layer.borderWidth = i.borderWidth!
                } else {
                     Button.layer.borderWidth = 0
                }
                
                
                // MARK: SET UP STACK VIRE OF BUTTOM
                let stackView = UIStackView()
                stackView.backgroundColor = .clear
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.axis = .horizontal
                stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                stackView.isLayoutMarginsRelativeArrangement = true
                stackView.addArrangedSubview(Button)
                stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
           
              
                // MARK: ADD STATCK TO ActionStackView
                self.ActionStackView.addArrangedSubview(stackView)
                self.ActionStackView.setCustomSpacing(8, after: stackView)
                
            count += 1
                
            }
        }
    }
    
    
    
    
    // MARK: Button button
    @objc func didPressButton(_ sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
            if ArrayButtons != nil {
            let dic = ArrayButtons![sender.tag]
             for (_,value) in dic.buttonAction {
                 let action: () -> Void = value
                 action()
                self.dismiss(animated: true, completion: nil)
                if let first = self.presentingViewController {
                    for subview in first.view.subviews {
                        UIView.animate(withDuration: 0.5, animations: {
                            if (subview.tag == 100) {
                                    subview.alpha = 0
                                }
                            }, completion: { (finished: Bool) in
                                if finished{
                                    if (subview.tag == 100) {
                                        subview.removeFromSuperview()
                                    }
                                }
                        })
                    }
                }
                }
            }
     }
    
    
    
    // MARK: Dismiss button
    @objc func didPressCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        if let first = self.presentingViewController {
            for subview in first.view.subviews {
                UIView.animate(withDuration: 0.5, animations: {
                    if (subview.tag == 100) {
                            subview.alpha = 0
                        }
                    }, completion: { (finished: Bool) in
                        if finished{
                            if (subview.tag == 100) {
                                subview.removeFromSuperview()
                            }
                        }
                })
            }
        }
    }
    

}


public extension UIViewController {

    func ShowAlertControllerButtons(icons: UIImage?,
                                    title: String?,
                                    titleColor: UIColor?,
                                    messageColor: UIColor?,
                                    message:String?,
                                    backgroundColor:UIColor?,
                                    lineColor: UIColor?,
                                    DismissTitle: String?,
                                    DismissColor: UIColor?,
                                    DismissTitleColor: UIColor?,
                                    actions: [AlertActionButtons]?) {
        let alertVC = AlertControllerButtons()
        alertVC.icons = icons
        alertVC.Title = title
        alertVC.TitleColor = titleColor
        alertVC.Message = message
        alertVC.MessageColor = messageColor
        alertVC.backgroundColor = backgroundColor
        alertVC.lineColor = lineColor
        alertVC.ArrayButtons = actions
        alertVC.DismissTitle = DismissTitle
        alertVC.DismissColor = DismissColor
        alertVC.DismissTitleColor = DismissTitleColor
        alertVC.modalTransitionStyle = .coverVertical
        alertVC.modalPresentationStyle = .custom
        self.present(alertVC, animated: true, completion: nil)
        
        
    }

}
