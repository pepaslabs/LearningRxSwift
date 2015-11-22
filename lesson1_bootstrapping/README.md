# Lesson 1: Bootstrapping

Make an app which includes RxSwift.

`Xcode -> File -> New -> Project -> Single View Application`

Choose "Swift" as the language.

In the same directory as your `.xcodeproj` file, create a file named `Cartfile` and put this in it:

```
github "ReactiveX/RxSwift" "2.0.0-beta.3"
```

If you haven't already, [install Carthage](https://github.com/Carthage/Carthage).

Run carthage:

```
carthage update
```

Drag the built frameworks into the "Embedded Binaries" section of the "General" tab of your project's settings screen.

Verify that your app builds and runs without error.
