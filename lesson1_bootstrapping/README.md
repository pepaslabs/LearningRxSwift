# Lesson 1: Bootstrapping

## Problem statement

Make an app which includes RxSwift.

## Solution

My solution is included in the [solution](solution) folder of this repo.

Open Xcode, then:

`Xcode -> File -> New -> Project -> Single View Application`

Choose "Swift" as the language.

In the same directory as your `.xcodeproj` file, create a file named `Cartfile` and put this in it:

```
github "ReactiveX/RxSwift" "2.0.0-beta.3"
```

If you haven't already, [install Carthage](https://github.com/Carthage/Carthage).

Run carthage:

```
carthage update --platform iOS
```

Drag the `*.framework` files from `Carthage/Build/iOS` into the "Embedded Binaries" section of the "General" tab of your project's settings screen.  Uncheck "Copy items if needed".

Verify that your app builds and runs without error.

**Note**: I have omitted the `Carthage` folder from the solution, because it includes large binary files.  In order to run the solution, you will need to run `carthage update --platform iOS`.
