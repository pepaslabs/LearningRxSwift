//
//  ViewController.swift
//  RxSwiftUIScrollView
//
//  Created by Pepas Personal on 11/28/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

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
