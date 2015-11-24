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

class InfiniteHelloGenerator
{
    class func generate() -> Observable<String>
    {
        return RxSwift.generate("hello",
                condition: { (_) -> Bool in return true},
                iterate: { (s) -> String in return s })
    }
}

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

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InfiniteHelloGenerator.generate().subscribeNext { (s) -> Void in
            debugPrint(s)
        }.addDisposableTo(disposeBag)
    }
}
