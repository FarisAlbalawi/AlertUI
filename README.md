# AlertUI

[![CI Status](https://img.shields.io/travis/farisalbalawi/AlertUI.svg?style=flat)](https://travis-ci.org/farisalbalawi/AlertUI)
[![Version](https://img.shields.io/cocoapods/v/AlertUI.svg?style=flat)](https://cocoapods.org/pods/AlertUI)
[![License](https://img.shields.io/cocoapods/l/AlertUI.svg?style=flat)](https://cocoapods.org/pods/AlertUI)
[![Platform](https://img.shields.io/cocoapods/p/AlertUI.svg?style=flat)](https://cocoapods.org/pods/AlertUI)

## Example
![giphy](https://user-images.githubusercontent.com/18473439/68200640-49328f80-ff8e-11e9-9199-869310f13f99.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Features 
- Easy to customize: change colors, icons, etc. 
- Add image
- Add title 
- Add messages
- Add icons
- Add button action as you want
- 3 Alert view each one is different
-  swift 5

## Requirements
- iOS 13 or later
- Xcode 11 or later


## Screenshot
|![Simulator Screen Shot - iPhone 11 Pro Max - 2019-11-05 at 05 28 39](https://user-images.githubusercontent.com/18473439/68201884-a596ae80-ff90-11e9-87bc-207edc1dd64f.png) | ![Simulator Screen Shot - iPhone 11 Pro Max - 2019-11-05 at 05 28 57](https://user-images.githubusercontent.com/18473439/68201017-fdccb100-ff8e-11e9-93c6-cb0336dbaee8.png)  | ![Simulator Screen Shot - iPhone 11 Pro Max - 2019-11-05 at 05 29 07](https://user-images.githubusercontent.com/18473439/68201027-01603800-ff8f-11e9-8a55-edd4d27ecba5.png)

 
## Installation
AlertUI is available through [CocoaPods](https://cocoapods.org/pods/AlertUI). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AlertUI'
```

```ruby
import AlertUI
```

# Functions
## AlertAction:
```swift
init(buttonAction:[String: () -> Void], buttonColor: UIColor, imageName:String? ,imageColor:UIColor? )
```  
#### Example
```swift
let buttonAction : [String: () -> Void] = [ "button title":  {
      print("tapped")
}]
let arrayActions = [
AlertAction(buttonAction: buttonAction, buttonColor: UIColor.black, imageName: "follow", imageColor: UIColor.black)
 ]
```  
### show Alert:
```swift
func showAlertControllerOptions(
icons: UIImage?,
title: String?,
titleColor: UIColor?,
messageColor: UIColor?,
message:String?,
backgroundColor:UIColor?,
lineColor: UIColor?,
DismissTitle: String?,
DismissColor: UIColor?,
DismissTitleColor: UIColor?,
actions: [AlertAction]?)
``` 

## AlertActionButtons:
```swift
init(
buttonAction:[String: () -> Void],
titleColor:UIColor,
backgroundColor:UIColor?,
borderColor:UIColor?,
borderWidth:CGFloat?
)
```  
#### Example
```swift
let Follow : [String: () -> Void] = [ "Follow":  {
print("tapped Follow")
 }]

 let arrayActions = [
AlertActionButtons(buttonAction: Follow, titleColor: UIColor.white, backgroundColor: UIColor.red, borderColor: nil, borderWidth: nil),     
        ]
```  
### show Alert:
```swift
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
actions: [AlertActionButtons]?)
``` 

## Show Alert with only message and image:
```swift
func showAlert(
icons: UIImage?,
title: String?,
titleColor: UIColor?,
messageColor: UIColor?,
message:String?,
backgroundColor:UIColor?,
DismissTitle: String?,
DismissColor: UIColor?,
DismissTitleColor: UIColor?)
``` 

## Author
Faris Albalawi,
developer.faris@gmail.com

## License
AlertUI is available under the MIT license. See the LICENSE file for more info.
