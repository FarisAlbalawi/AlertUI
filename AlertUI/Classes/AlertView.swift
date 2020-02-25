//
//  AlertView.swift
//  AlertUI
//
//  Created by Faris Albalawi on 11/5/19.
//

import UIKit

class AlertView: UIViewController {

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
         Button.setTitle("Done", for: .normal)
         Button.setTitleColor(.black, for: .normal)
         Button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.black)
         Button.backgroundColor = UIColor(red: 0.9412, green: 0.9412, blue: 0.9451, alpha: 1.0)
         Button.layer.borderColor = UIColor(red: 0.9412, green: 0.9412, blue: 0.9451, alpha: 1.0).cgColor
         Button.layer.borderWidth = 3
         Button.layer.cornerRadius = 30
         Button.translatesAutoresizingMaskIntoConstraints = false
         Button.addTarget(self, action:#selector(didPressDoneButton(_:)), for: UIControl.Event.touchUpInside)
         return Button
     }()
    
    
    
    // MARK: variables
    var Message: String?
    var MessageColor: UIColor?
    var Title: String?
    var TitleColor: UIColor?
    var icons: UIImage?
    var backgroundColor: UIColor?
    var DismissTitle: String?
    var DismissColor: UIColor?
    var DismissTitleColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // MARK: Subview
           self.AlertView.layer.cornerRadius = 20
           self.AlertView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
            self.view.addSubview(AlertView)
            self.AlertView.addSubview(buttonDismiss)
            self.AlertView.addSubview(IconsStackView)
            self.AlertView.addSubview(textStackView)
    
            self.textStackView.addArrangedSubview(AlertTitle)
            self.textStackView.addArrangedSubview(AlertMassage)
            self.textStackView.setCustomSpacing(10, after: AlertTitle)
            
        // MARK: CALL FUNC
        self.setUpIcons()
        self.setView()
        self.setUpCancelDismiss()
        self.setUpTitle()
        
            // MARK: Layout
            NSLayoutConstraint.activate([
                
                self.AlertView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
                self.AlertView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.AlertView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
                self.IconsStackView.topAnchor.constraint(equalTo: self.AlertView.topAnchor,constant: 10),
                self.IconsStackView.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor),
                self.IconsStackView.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor),
    
                self.textStackView.topAnchor.constraint(equalTo: self.IconsStackView.bottomAnchor,constant: 15),
                self.textStackView.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor),
                self.textStackView.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor),
                self.textStackView.bottomAnchor.constraint(equalTo: self.buttonDismiss.topAnchor,constant: -20),
                
                self.buttonDismiss.heightAnchor.constraint(equalToConstant: 60),
                self.buttonDismiss.trailingAnchor.constraint(equalTo: self.AlertView.trailingAnchor,constant: -30),
                self.buttonDismiss.leadingAnchor.constraint(equalTo: self.AlertView.leadingAnchor,constant: 30),
                self.buttonDismiss.bottomAnchor.constraint(equalTo: self.AlertView.bottomAnchor,constant: -25),
            ])
        
        
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

    }
    
    // MARK: SET UP ICONS IMAGE
    func setUpIcons() {
        if icons != nil {
            let iconsImage = UIImageView(image: icons!)
            iconsImage.backgroundColor = .clear
            iconsImage.translatesAutoresizingMaskIntoConstraints = false
            iconsImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
            iconsImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
            self.IconsStackView.addArrangedSubview(iconsImage)
        }
    }
    
    
    // MARK: SET UP DISMISS BUTTON
    func setUpCancelDismiss() {
        if DismissTitle != nil {
            buttonDismiss.setTitle(DismissTitle!, for: .normal)
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
    }
    
    
    // MARK: Dismiss button
    @objc func didPressDoneButton(_ sender: UIButton) {
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
    func showAlert(
        icons: UIImage?,
        title: String?,
        titleColor: UIColor?,
        messageColor: UIColor?,
        message:String?,
        backgroundColor:UIColor?,
        DismissTitle: String?,
        DismissColor: UIColor?,
        DismissTitleColor: UIColor?) {
        
        let alertVC = AlertView()
        alertVC.icons = icons
        alertVC.Title = title
        alertVC.TitleColor = titleColor
        alertVC.Message = message
        alertVC.MessageColor = messageColor
        alertVC.backgroundColor = backgroundColor
        alertVC.DismissTitle = DismissTitle
        alertVC.DismissColor = DismissColor
        alertVC.DismissTitleColor = DismissTitleColor
        alertVC.modalTransitionStyle = .coverVertical
        alertVC.modalPresentationStyle = .custom
        self.present(alertVC, animated: true, completion: nil)
        
        
    }

}
