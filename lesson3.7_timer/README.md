# Lesson 3.7: `timer`

## Problem statement

Write an app which spits out a single "hello" message after a 3 second delay, using `func timer`.

### Problem project

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class DelayedSingleHelloGenerator
{
    class func generate() -> Observable<String>
    {
        let delayedObservable = timer(3, MainScheduler.sharedInstance)
        
        let helloObservable = delayedObservable.map({ (_) -> String in
            return "hello"
        })
        
        return helloObservable
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DelayedSingleHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
```

### Discussion:

Here, we use `func timer` to generate a single `Event` after a 3 second delay, which we then map to a "hello" message.

Start up the app and verify that you see a single "hello" after a 3 second delay:

```
"hello"
```

The `timer` function also has a second interface which includes an initial delay value.  We can combine the functionality of lesson 3.6 and 3.7 together to generate an infinite stream of one-second interval "hello" messages which start after a 3 second delay:

```swift
class DelayedTickHelloGenerator
{
    class func generate() -> Observable<String>
    {
        let tickerObservable = timer(3.0, 1.0, MainScheduler.sharedInstance)
        
        let helloObservable = tickerObservable.map { (_) -> String in
            return "hello"
        }
        
        return helloObservable
    }
}
```

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func timer` in `Observable+Creation.swift`

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

