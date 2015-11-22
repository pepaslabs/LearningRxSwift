# Lesson 2: RxSwiftButtonBackgroundColorDemo

## Problem statement

Make an app which:

* Has a button
* Changes the view's background color to green when the button is pressed.

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

My solution is included in the [solution](solution) folder of this repo.

```swift
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.rx_tap.subscribeNext { [weak self] () -> Void in
            self?.view.backgroundColor = UIColor.greenColor()
        }
        
    }
}
```

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.
