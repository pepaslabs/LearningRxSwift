# Lesson 3.4: `sequenceOf`

## Problem statement

Write an app which spits out three "hello" messages to the debugging console, using `func sequenceOf`.

### Problem project

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

### Discussion:

Here, we use `func sequenceOf`, to generate only three "hello" messages:

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class TripleHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return sequenceOf("hello","hello","hello")
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TripleHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
```

Start up the app and verify that you see three "hello" messages in the console:

```
"hello"
"hello"
"hello"
```

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func sequenceOf` in `Observable+Creation.swift`

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.
