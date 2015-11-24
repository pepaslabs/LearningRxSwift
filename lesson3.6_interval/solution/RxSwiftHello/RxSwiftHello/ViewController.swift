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
        let tickerObservable = RxSwift.interval(1, MainScheduler.sharedInstance)

        let helloObservable = tickerObservable.map({ (_) -> String in
            return "hello"
        })
        
        return helloObservable
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
