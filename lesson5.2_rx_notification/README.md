# Lesson 5.2: `NSNotificationCenter.rx_notification`

## Problem statement

Make an app which:

* Prints "didEnterBackground" to the console when the app is backgrounded.
* Prints "willEnterForeground" to the console when the app is resumed.

![screen shot](https://raw.githubusercontent.com/pepaslabs/LearningRxSwift/master/lesson5.2_rx_notification/.media/Screen%20Shot%202015-11-28%20at%209.09.04%20PM.png)

### Problem project

You can use the project in the [problem](problem) folder of this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController
{
    let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().rx_notification(UIApplicationDidEnterBackgroundNotification)
            .subscribeNext { (notification) -> Void in
                debugPrint("didEnterBackground")
            }.addDisposableTo(disposeBag)
        
        NSNotificationCenter.defaultCenter().rx_notification(UIApplicationWillEnterForegroundNotification)
            .subscribeNext { (notification) -> Void in
                debugPrint("willEnterForeground")
            }.addDisposableTo(disposeBag)
    }
}
```

### Discussion:

We subscribe to `NSNotificationCenter`'s `rx_notification` property for the UIApplicationDidEnterBackgroundNotification and UIApplicationWillEnterForegroundNotification notifications.

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `NSNotificationCenter+Rx.swift`

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

