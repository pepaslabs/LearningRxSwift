# Lesson 2.2: `DisposeBag`

## Problem statement

Add proper memory management to `RxSwiftButtonBackgroundColorDemo` from Lesson 2.1.

### Problem project

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

### Discussion:

There is a bit of boilerplate which we must accept with RxSwift, and that is using a `DisposeBag` to properly handle memory management of the `Observable`s.

Basically, anytime you subscribe to an `Observable`, the result of that subscription needs to be added to a `DisposeBag`.

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.rx_tap.subscribeNext { [weak self] () -> Void in
            self?.view.backgroundColor = UIColor.greenColor()
        }.addDisposableTo(disposeBag)
        
    }
}
```

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `DisposeBag.swift`
  * Take another look at `ObservableType.swift`.  Note that `func subscribe` returns a `Disposable`.

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

