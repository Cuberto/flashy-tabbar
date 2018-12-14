# CBFlashyTabBarController

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/Cuberto/flashy-tabbar/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/CBFlashyTabBarController.svg)](http://cocoapods.org/pods/CBFlashyTabBarController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Cuberto/flashy-tabbar)
[![Swift 4.0](https://img.shields.io/badge/Swift-4.2-green.svg?style=flat)](https://developer.apple.com/swift/)

![Animation](https://raw.githubusercontent.com/Cuberto/flashy-tabbar/master/Screenshots/animation.gif)

## Example

To run the example project, clone the repo, and run `ExampleApp`  scheme from FlashyTabBar.xcodeproj

## Requirements

- iOS 10.0+
- Xcode 9

## Installation

### CocoaPods
To install Flashy TabBar add the following line to your Podfile:
```ruby
pod 'CBFlashyTabBarController'
```
Then run `pod install`.

### Carthage

Make the following entry in your Cartfile:

```
github "Cuberto/flashy-tabbar"
```

Then run `carthage update`.

If this is your first time using Carthage in the project, you'll need to go through some additional steps as explained [over at Carthage](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

### Manual

Add CBFlashyTabBarController folder to your project

## Usage

### With Storyboard

1. Create a new UITabBarController in your storyboard or nib.

2. Set the class of the UITabBarController to CBFlashyTabBarController in your Storyboard or nib.

3. Add a custom image icon and title for UITabBarItem of each child ViewContrroller

### Without Storyboard

1. Import CBFlashyTabBarController
2. Instantiate `CBFlashyTabBarController`
3. Add some child controllers and don't forget to set them tabBar items with title and image


## Author

Cuberto Design, info@cuberto.com

## License

CBFlashyTabBarController is available under the MIT license. See the LICENSE file for more info.
