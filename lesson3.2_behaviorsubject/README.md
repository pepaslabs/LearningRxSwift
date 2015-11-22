# Lesson 3.2: BehaviorSubject

## Problem statement

Modify the solution to [Lesson 3.1] such that `view.backgroundColor` reflects the reachability status immediately, without having to wait for a change in reachability status.

You can use [problem/RxSwiftReachabilityBackgroundColorDemo](problem/RxSwiftReachabilityBackgroundColorDemo) included in this repo as a starting point.

I have added a dependency against [Reachability.swift](https://github.com/ashleymills/Reachability.swift) to the `Cartfile`, and I have pulled in a copy of `ReachabilityService.swift` from `RxExample`.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

### Discussion:


`ViewController.swift`:

```swift
```

Start up the app in the simulator and verify that the background color immediately relfects the current reachability status of your Mac.

#### New concepts to explore

* Open up `RxExample.xcodeproj`
  * Read through `PublishSubject.swift`
  * Read through `BehaviorSubject.swift`
