//
//  ViewController.swift
//  Demo
//
//  Created by jinsei shima on 2017/12/31.
//  Copyright © 2017 jinsei shima. All rights reserved.
//

import UIKit
import TapCardView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        let card = TapCardView(frame: frame)
        card.backgroundColor = UIColor.lightGray
        card.layer.cornerRadius = 8.0
        card.clipsToBounds = true
        card.center = view.center
        view.addSubview(card)
    }

}

