# Lesson 2.3: map

## Problem statement

Modify `RxSwiftButtonBackgroundColorDemo` to use the `map` function to transform the `Event` sent by `rx_tap` into a `UIColor` which by applied by the closure passed to `func subscribeNext`.

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

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

    @IBOutlet weak var button: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.rx_tap.map { () -> UIColor in
            
            return UIColor.greenColor()
            
        }.subscribeNext { [weak self] (color) -> Void in
            
            self?.view.backgroundColor = color
            
        }.addDisposableTo(disposeBag)
        
    }
}
```

### Discussion:

We introduce the `map` function which transforms a `Void` into a `UIColor`.  This allows us to make the closure which we pass to `subscribeNext` accept any `UIColor`, rather than being hard-coded to always use `greenColor`.

#### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func map` in `Observable+StandardSequenceOperators.swift`
  * Take a look at `func composeMap` in `Observable.swift`
  * Take a look at `class Map` in `Map.swift`
