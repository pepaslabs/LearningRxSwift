//
//  ViewController.swift
//  RxSwiftButtonBackgroundColorDemo
//
//  Created by Pepas Personal on 11/22/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.rx_tap.map { () -> UIColor in
            
            return UIColor.greenColor()
            
        }.subscribeNext { [weak self] (color) -> Void in
            
            self?.view.backgroundColor = color
            
        }.addDisposableTo(disposeBag)
        
    }
}
