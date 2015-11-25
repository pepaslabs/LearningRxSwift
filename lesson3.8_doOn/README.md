# Lesson 3.8: side-effects: `doOn`

## Problem statement

Modiy the solution from [Lesson 3.6](../lesson3.6_interval) to produce a side-effect for each "hello" which is generated, using `func doOn`.

### Problem project

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class TickHelloGenerator
{
    class func generate() -> Observable<String>
    {
        let tickerObservable = interval(1, MainScheduler.sharedInstance)
        
        let sideEffectingObservable = tickerObservable.doOn { (_) -> Void in
            debugPrint("side-effect")
        }
        
        let helloObservable = sideEffectingObservable.map({ (_) -> String in
            return "hello"
        })
        
        return helloObservable
    }
}

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TickHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
```

### Discussion:

Here, we use `func doOn` to produce a side-effect for each `Event` which propogates through the `Observable` chain.

Start up the app and verify that you see a side-effect message for each "hello" message:

```
"side-effect"
"hello"
"side-effect"
"hello"
"side-effect"
"hello"
```

We can write a wrapper function which effectively renames `func doOn` as `func sideEffect` to make this more explicit.  Here's an example of doing so, with some more terse `Observable` chaining syntax:

```swift
extension ObservableType
{
    public func sideEffect(eventHandler: (RxSwift.Event<Self.E>) throws -> Void) -> RxSwift.Observable<Self.E>
    {
        return doOn(eventHandler)
    }
}

class TickHelloGenerator2
{
    class func generate() -> Observable<String>
    {
        return interval(1, MainScheduler.sharedInstance)
            .sideEffect({ (_) -> Void in
                debugPrint("side-effect")
            })
            .map({ (_) -> String in
                return "hello"
            })
    }
}
```

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func doOn` in `Observable+Creation.swift`

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

