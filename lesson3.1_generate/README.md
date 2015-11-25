# Lesson 3.1: `generate`

## Problem statement

Write an app which spits out an infinite series of "hello" messages to the debugging console.

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

### Discussion:

We introduce `func generate()`, use it to create an `Observable<String>`, and our `ViewController` subscribes to its stream of `Event<String>`.

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class InfiniteHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return RxSwift.generate("hello",
                condition: { (_) -> Bool in return true},
                iterate: { (s) -> String in return s })
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

What's going on here?  A slightly more verbose version of `InfiniteHelloGenerator` will be illustrative:

```swift
class VerboseInfiniteHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return RxSwift.generate("hello", condition: { (s) -> Bool in
            
            debugPrint("condition closure.  s: \(s)")
            return true
            
        }, iterate: { (s) -> String in
            
            debugPrint("iterate closure.  s: \(s)")
            return s
            
        })
    }
}
```

Hook that up to `ViewController`, fire that up in the simulator and you should see this in the console:

```
"condition closure.  s: hello"
"hello"
"iterate closure.  s: hello"
"condition closure.  s: hello"
"hello"
"iterate closure.  s: hello"
"condition closure.  s: hello"
"hello"
"iterate closure.  s: hello"
...
```

#### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func generate` in `Observable+Creation.swift`
