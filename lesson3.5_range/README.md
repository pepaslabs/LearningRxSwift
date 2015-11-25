# Lesson 3.5: `range`

## Problem statement

Write an app which spits out 100 "hello" messages, using `func range`.

### Problem project

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class OneHundredHelloGenerator
{
    class func generate() -> Observable<String>
    {
        let intsObservable = range(0, 100)
        
        let helloObservable = intsObservable.map({ (_) -> String in
            return "hello"
        })
        
        return helloObservable
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OneHundredHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
```

### Discussion:

Here, we use `func range` to generate 100 "hello" messages

Start up the app and verify that you see 100 "hello" messages in the console:

```
"hello"
"hello"
"hello"
...
```

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func range` in `Observable+Creation.swift`

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

