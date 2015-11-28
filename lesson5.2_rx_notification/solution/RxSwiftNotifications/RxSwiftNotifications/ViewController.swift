//
//  ViewController.swift
//  RxSwiftNotifications
//
//  Created by Pepas Personal on 11/28/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController
{
    let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().rx_notification(UIApplicationDidEnterBackgroundNotification)
            .subscribeNext { (notification) -> Void in
                debugPrint("didEnterBackground")
            }.addDisposableTo(disposeBag)
        
        NSNotificationCenter.defaultCenter().rx_notification(UIApplicationWillEnterForegroundNotification)
            .subscribeNext { (notification) -> Void in
                debugPrint("willEnterForeground")
            }.addDisposableTo(disposeBag)
    }
}
