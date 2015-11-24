# Lesson 3.2: repeatElement

## Problem statement

Write an app which spits out an infinite series of "hello" messages to the debugging console, using `func repeatElement`.

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

### Discussion:

RxSwift includes a number of convenience variations on `func generate`, and the rest of this chapter will be about exploring those.

Here, we use `func repeatElement`, which truly makes the implementation of `InfiniteHelloGenerator` trivial:

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class InfiniteHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return RxSwift.repeatElement("hello", MainScheduler.sharedInstance)
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InfiniteHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
```

Start up the app and verify that you see an infinite stream of "hello" in the console:

```
"hello"
"hello"
"hello"
...
```

#### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func repeatElement` in `Observable+Creation.swift`
