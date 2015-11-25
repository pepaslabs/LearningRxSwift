# Lesson 4.1: `ReachabilityService`

## Problem statement

Write an app which uses `view.backgroundColor` to reflect the state of network reachability:
* `greenColor` when reachable
* `redColor` when not reachable

### Problem project

You can use [problem/RxSwiftReachabilityBackgroundColorDemo](problem/RxSwiftReachabilityBackgroundColorDemo) included in this repo as a starting point.

I have added a dependency against [Reachability.swift](https://github.com/ashleymills/Reachability.swift) to the `Cartfile`, and I have pulled in a copy of `ReachabilityService.swift` from `RxExample`.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReachabilityService.sharedReachabilityService.reachabilityChanged.subscribeNext { [weak self] (status) -> Void in
            switch status
            {
            case .Reachable:
                self?.view.backgroundColor = UIColor.greenColor()
            case .Unreachable:
                self?.view.backgroundColor = UIColor.redColor()
            }
        }.addDisposableTo(disposeBag)
    }

}
```

### Discussion:

Here, we subscribe to the `ReachabilityService` from `RxExample` and set the background color accordingly:

However, our closure is both converting a `ReachabilityStatus` into a `UIColor`, and applying that color to `view.backgroundColor`.  We can separate these two concerns by using the [`map`](http://rxmarbles.com/#map) function:

```swift
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReachabilityService.sharedReachabilityService.reachabilityChanged.map { (status) -> UIColor in
            switch status
            {
            case .Reachable:
                return UIColor.greenColor()
            case .Unreachable:
                return UIColor.redColor()
            }
        }.subscribeNext { [weak self] (color) -> Void in
            self?.view.backgroundColor = color
        }.addDisposableTo(disposeBag)
    }

}
```

Start up the app in the simulator, then toggle your Mac's wifi on and off and verify the background color changes to reflect this.

However, there is a problem with this solution:
* When the app first starts up, it doesn't recieve an `Event` from `ReachabilityService` to reflect the initial `ReachabilityStatus`.  That is, `view.backgroundColor` is white until a change in `ReachabilityStatus` occurs.  We will address this in [Lesson 4.2](../lesson4.2_behaviorsubject).

### New concepts to explore

* Read through `ReachabilityService.swift`.

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

