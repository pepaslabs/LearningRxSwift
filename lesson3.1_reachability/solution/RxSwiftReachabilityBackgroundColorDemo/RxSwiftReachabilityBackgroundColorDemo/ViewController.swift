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
        
        ReachabilityService.sharedReachabilityService.reachabilityChanged.map { (status) -> UIColor in
            switch status
            {
            case .Reachable:
                return UIColor.greenColor()
            case .Unreachable:
                return UIColor.redColor()
            }
        }.subscribeNext { [weak self] (color) -> Void in
            self?.view.backgroundColor = color
        }.addDisposableTo(disposeBag)
    }

}
