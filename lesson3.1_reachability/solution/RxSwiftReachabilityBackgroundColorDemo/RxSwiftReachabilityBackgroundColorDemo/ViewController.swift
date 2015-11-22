//
//  ViewController.swift
//  RxSwiftReachabilityBackgroundColorDemo
//
//  Created by Pepas Personal on 11/22/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReachabilityService.sharedReachabilityService.reachabilityChanged.subscribeNext { [weak self] (status) -> Void in
            switch status
            {
            case .Reachable:
                self?.view.backgroundColor = UIColor.greenColor()
            case .Unreachable:
                self?.view.backgroundColor = UIColor.redColor()
            }
        }.addDisposableTo(disposeBag)
    }

}

