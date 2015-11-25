//
//  ViewController.swift
//  RxSwiftHello
//
//  Created by Pepas Personal on 11/24/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TickHelloGenerator
{
    class func generate() -> Observable<String>
    {
        let tickerObservable = interval(1, MainScheduler.sharedInstance)
        
        let sideEffectingObservable = tickerObservable.doOn { (_) -> Void in
            debugPrint("side-effect")
        }
        
        let helloObservable = sideEffectingObservable.map({ (_) -> String in
            return "hello"
        })
        
        return helloObservable
    }
}

extension ObservableType
{
    public func sideEffect(eventHandler: (RxSwift.Event<Self.E>) throws -> Void) -> RxSwift.Observable<Self.E>
    {
        return doOn(eventHandler)
    }
}

class TickHelloGenerator2
{
    class func generate() -> Observable<String>
    {
        return interval(1, MainScheduler.sharedInstance)
            .sideEffect({ (_) -> Void in
                debugPrint("side-effect")
            })
            .map({ (_) -> String in
                return "hello"
            })
    }
}

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TickHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
