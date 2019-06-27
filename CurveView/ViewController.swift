//
//  ViewController.swift
//  CurveView
//
//  Created by Aradhana Verma on 27/06/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = CurveView.init(frame: self.view.frame)
        self.view.addSubview(view)
        self.view.sendSubviewToBack(view)
    }


}

