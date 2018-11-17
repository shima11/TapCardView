# TapCardView
UIView to detect a tap position.
If you do customize, Tinder like card UI is a possible.

TapCardView is to detect a tap position as left, right, bottom.
And a flip animation is a possible.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/TapCardView.svg?style=flat)](http://cocoapods.org/pods/DataSources)
[![License](https://img.shields.io/cocoapods/l/TapCardView.svg?style=flat)](http://cocoapods.org/pods/TapCardView)
 ![Swift 3.x](https://img.shields.io/badge/Swift-3.x-orange.svg)
 [![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

# OverView
![](demo.gif)

# Install

### Carthage
For installing with Carthage, add it to your Cartfile.

```
github "shima11/TapCardView"
```

Do this command with terminal.

```
$ carthage update
```

Then, You need to add `TapCardView.framework` to your project.

### CocoaPods

For installing with CocoaPods, add it to your Podfile.

```
pod "TapCardView"
```

Do this command with terminal.

```
$ pod update
```

# Usage

TapCarView is devides Tap position into left, right, bottom.
`horizontalBorder` of property decides horizontal border of Tap position.
`verticalBorder` of property decides vertical border of Tap position.

![](demo2.png)

## Basic
The basic usage is as follows.

```
class ViewController: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()

      let frame = CGRect(x:100, y:100, width:300, height:400)
      let cardView = TapCardView(frame: frame)
      cardView.delegate = self
      view.addSubView(cardView)
    }
}

extension ViewController: CardViewDelegate {

    func tapPosition(type: TapPosition, sender: TapCardView) {

        print(type)

        switch type {
        case .left:
            break
        case .right:
            break
        case .bottom:
            break
        }
    }
}
```

## Customization
If you do customize like `Demo/CustomTapCardView`, Tinder like card UI is a possible.

# Licence

Licence MIT
