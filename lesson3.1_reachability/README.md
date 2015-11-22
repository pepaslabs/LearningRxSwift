# Lesson 3.1: Reachability

## Problem statement

Write an app which uses `view.backgroundColor` to reflect the state of network reachability:
* `greenColor` when reachable
* `redColor` when not reachable

You can use [problem/RxSwiftReachabilityBackgroundColorDemo](problem/RxSwiftReachabilityBackgroundColorDemo) included in this repo as a starting point.

I have added a dependency against [Reachability.swift](https://github.com/ashleymills/Reachability.swift) to the `Cartfile`, and I have pulled in a copy of `ReachabilityService.swift` from `RxExample`.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

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


#### New concepts to explore

* Open up `RxExample.xcodeproj`.
