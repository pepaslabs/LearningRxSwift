//
//  ViewController.swift
//  RxSwiftMarginDemo
//
//  Created by Pepas Personal on 11/28/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController
{
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMarginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var shrinkMarginButton: UIBarButtonItem!
    @IBOutlet weak var expandMarginButton: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
