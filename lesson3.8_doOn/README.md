# Lesson 3.8: side-effects: `doOn`

## Problem statement

Modiy the solution from [Lesson 3.6]() to produce a side-effect for each "hello" which is generated, using 'func doOn'.

### Problem project

You can use [problem/RxSwiftButtonBackgroundColorDemo](problem/RxSwiftButtonBackgroundColorDemo) included in this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

`ViewController.swift`:

```swift
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

```swift
FIXME create a sideEffect function alias here
```

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `func doOn` in `Observable+Creation.swift`

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

