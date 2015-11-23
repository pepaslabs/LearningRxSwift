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
import Reachability

class RxReachabilityService
{
    static let sharedInstance = RxReachabilityService()
    
    var reachabilityChanged: Observable<Reachability.NetworkStatus> {
        get {
            return reachabilitySubject.asObservable()
        }
    }
    
    init()
    {
        try! reachability = Reachability.reachabilityForInternetConnection()

        let up = reachability.currentReachabilityStatus
        reachabilitySubject = BehaviorSubject<Reachability.NetworkStatus>(value: up)

        let reachabilityChangedClosure: (Reachability) -> () =  { [weak self] (reachability) in
            self?.reachabilitySubject.on(.Next(reachability.currentReachabilityStatus))
        }
        
        reachability.whenReachable = reachabilityChangedClosure
        reachability.whenUnreachable = reachabilityChangedClosure
        
        try! reachability.startNotifier()
    }
    
    private let reachability: Reachability
    private let reachabilitySubject: BehaviorSubject<Reachability.NetworkStatus>
}

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RxReachabilityService.sharedInstance.reachabilityChanged.map { (status) -> UIColor in
            switch status
            {
            case .ReachableViaWiFi:
                fallthrough
            case .ReachableViaWWAN:
                return UIColor.greenColor()
            case .NotReachable:
                return UIColor.redColor()
            }
        }.subscribeNext { [weak self] (color) -> Void in
            self?.view.backgroundColor = color
        }.addDisposableTo(disposeBag)
    }

}
