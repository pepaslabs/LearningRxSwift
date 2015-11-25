# Lesson 3.3: `just`

## Problem statement

Write an app which spits out a single "hello" message to the debugging console, using `func just`.

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

### Discussion:

Here, we use `func just` to generate just one "hello" `Event<String>`.

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class SingleHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return just("hello")
    }
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SingleHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
```

Start up the app and verify that you see only one "hello" in the console:

```
"hello"
```

#### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func just` in `Observable+Creation.swift`
