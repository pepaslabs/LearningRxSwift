# Lesson 5.1: `UIScrollView.rx_contentOffset`

## Problem statement

Make an app which:

* Has a `UIScrollView`, with a content view which can scroll vertically.
* Has a label which displays the scroll view's `contentOffset` in real-time.

![screen shot](https://raw.githubusercontent.com/pepaslabs/LearningRxSwift/master/lesson5.1_uiscrollview_rxcontentOffset/.media/Screen%20Shot%202015-11-28%20at%209.11.56%20PM.png)

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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scrollView.rx_contentOffset.subscribeNext { [weak self] (point) -> Void in
            
            self?.label.text = "\(point)"
            
        }.addDisposableTo(disposeBag)
    }
}
```

### Discussion:

We subscribe to `scollViews`'s `rx_contentOffset` property and update the label's text to display the contentOffset.

### New concepts to explore

* Open up `RxExample.xcodeproj`.
  * Take a look at `UIScrollView+Rx.swift`

### Solution project

My solution is included in the [solution](solution) folder of this repo.

**Note**: I have omitted the `Carthage` folder from the solution project, because it includes large binary files.  In order to run the this project, you will need to run `carthage update --platform iOS`.

