# Lesson 5.3: `NSLayoutConstraint.rx_constant`

## Problem statement

Make an app which:

* Has a contentView within self.view, with top, bottom, leading, and trailing constraints
* Has a toolbar with "Expand Margin" and "Shrink Margin" buttons
  * The "Expand Margin" button increases the constraint constants by 5
  * The "Shrink Margin" button increases the constraint constants by 5
* Has a label which indicates the size of the margin

![screen shot](https://raw.githubusercontent.com/pepaslabs/LearningRxSwift/master/lesson5.3_rx_constant/.media/Screen%20Shot%202015-11-28%20at%208.49.17%20PM.png)

### Problem project

You can use the project in the [problem](problem) folder of this repo as a starting point.

**Note**: I have omitted the `Carthage` folder from the problem project, because it includes large binary files.  In order to use the this project, you will need to run `carthage update --platform iOS`.

## Solution

`ViewController.swift`:

```swift
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController
{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMarginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var shrinkMarginButton: UIBarButtonItem!
    @IBOutlet weak var expandMarginButton: UIBarButtonItem!
    
    let marginStepSize: CGFloat = 5
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        shrinkMarginButton.rx_tap
            .subscribeNext { [weak self] () -> Void in
                self?._shrinkMargin()
            }
            .addDisposableTo(disposeBag)

        expandMarginButton.rx_tap
            .subscribeNext { [weak self] () -> Void in
                self?._expandMargin()
            }
            .addDisposableTo(disposeBag)
        
        topMarginConstraint.rx_observeWeakly(CGFloat.self, "constant")
            .subscribeNext { [weak self] (constant) -> Void in
                self?._synchronizeMarginConstants()
                self?._updateLabel()
            }
            .addDisposableTo(disposeBag)
    }

    private func _expandMargin()
    {
        guard contentView.bounds.width > marginStepSize
            && contentView.bounds.height > marginStepSize else
        {
            return
        }
        
        topMarginConstraint.constant += marginStepSize
    }
    
    private func _shrinkMargin()
    {
        guard topMarginConstraint.constant >= marginStepSize else
        {
            return
        }
        
        topMarginConstraint.constant -= marginStepSize
    }
    
    private func _synchronizeMarginConstants()
    {
        let constant = topMarginConstraint.constant
        leadingMarginConstraint.constant = constant
        trailingMarginConstraint.constant = constant
        bottomMarginConstraint.constant = constant
    }
    
    private func _updateLabel()
    {
        let margin = Int(topMarginConstraint.constant)
        label.text = "Margin: \(margin)"
    }
}
```

### Discussion:

We subscribe to `rx_tap` on both the shrink and expand margin button items.  In these subscriptions we trigger the side-effect of decreasing or increasing the `topMarginConstraint.constant` by 5 points.

We also subscribe (via KVO) to changes in the value of `topMarginConstraint.constant`, and use this event to update the other margin constraint constants to match.  Additionally, we update the label to reflect the new margin value.

However, observing the constant changes via KVO (`observeWeakly`) isn't quite a clean as the solution to [Lesson 5.1](../lesson5.1_uiscrollview_rxcontentOffset), where `UIScrollView` had a `rx_contentOffset` property which was directly observable.  We can make our solution a bit more idiomatic to RxSwift by implementing `rx_constant` on `NSLayoutConstraint`, like so:

```swift
extension NSLayoutConstraint
{
    var rx_constant: Observable<CGFloat?> {
        return rx_observeWeakly(CGFloat.self, "constant")
    }
}
```

We then update our subscription to use this property:

```swift
        topMarginConstraint.rx_constant
            .subscribeNext { [weak self] (constant) -> Void in
                self?._synchronizeMarginConstants()
                self?._updateLabel()
            }
            .addDisposableTo(disposeBag)
```

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at FIXME

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

