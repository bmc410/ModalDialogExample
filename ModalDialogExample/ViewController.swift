//
//  ViewController.swift
//  ModalDialogExample
//
//  Created by William McCoy on 12/7/16.
//  Copyright © 2016 William McCoy. All rights reserved.
//

import UIKit
import Presentr

class ViewController: UIViewController {

    
    @IBAction func ShowController(_ sender: UIButton) {
        popupDefault()
    }
    
    var presenter: Presentr = {
        let presenter = Presentr(presentationType: .alert)
        presenter.transitionType = TransitionType.coverHorizontalFromRight
        return presenter
    }()
    
    func popupDefault() {
        presenter.presentationType = .popup
        
        presenter.transitionType = nil
        presenter.dismissTransitionType = nil
        presenter.roundCorners = true
        presenter.cornerRadius = 10
        
        presenter.dismissAnimated = true
        customPresentViewController(presenter, viewController: popupViewController, animated: true, completion: nil)
    }
    
    
    let customPresenter: Presentr = {
        let width = ModalSize.full
        let height = ModalSize.custom(size: 150)
        //let height = ModalSize.fluid(percentage: 0.50)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: 0, y: 0))
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVerticalFromTop
        customPresenter.dismissTransitionType = .coverVerticalFromTop
        customPresenter.roundCorners = true
        customPresenter.backgroundColor = UIColor.green
        customPresenter.backgroundOpacity = 0.5
        return customPresenter
    }()
    
    lazy var popupViewController: PopupViewController = {
        let popupViewController = self.storyboard?.instantiateViewController(withIdentifier: "PopupViewController")
        return popupViewController as! PopupViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

