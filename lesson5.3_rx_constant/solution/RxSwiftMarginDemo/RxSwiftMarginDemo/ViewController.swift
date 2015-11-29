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

extension NSLayoutConstraint
{
    var rx_constant: Observable<CGFloat?> {
        return rx_observeWeakly(CGFloat.self, "constant")
    }
}

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
    
    let marginStepSize: CGFloat = 5
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        shrinkMarginButton.rx_tap
            .subscribeNext { [weak self] () -> Void in
                self?._shrinkMargin()
            }
            .addDisposableTo(disposeBag)

        expandMarginButton.rx_tap
            .subscribeNext { [weak self] () -> Void in
                self?._expandMargin()
            }
            .addDisposableTo(disposeBag)
        
        topMarginConstraint.rx_constant
            .subscribeNext { [weak self] (constant) -> Void in
                self?._synchronizeMarginConstants()
                self?._updateLabel()
            }
            .addDisposableTo(disposeBag)
    }

    private func _expandMargin()
    {
        guard contentView.bounds.width > marginStepSize
            && contentView.bounds.height > marginStepSize else
        {
            return
        }
        
        topMarginConstraint.constant += marginStepSize
    }
    
    private func _shrinkMargin()
    {
        guard topMarginConstraint.constant >= marginStepSize else
        {
            return
        }
        
        topMarginConstraint.constant -= marginStepSize
    }
    
    private func _synchronizeMarginConstants()
    {
        let constant = topMarginConstraint.constant
        leadingMarginConstraint.constant = constant
        trailingMarginConstraint.constant = constant
        bottomMarginConstraint.constant = constant
    }
    
    private func _updateLabel()
    {
        let margin = Int(topMarginConstraint.constant)
        label.text = "Margin: \(margin)"
    }
}
