//
//  ViewController.swift
//  Demo
//
//  Created by jinsei shima on 2017/12/31.
//  Copyright © 2017 jinsei shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let numberOfPage = 10
        var images: [UIImage] = []
        for index in  0..<numberOfPage {
            let imageNamed = NSString(format: "image%02d.jpg", index)
            guard let image = UIImage(named: imageNamed as String) else { return }
            images.append(image)
        }

        let frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        let card = CustomTapCardView(frame: frame, datas: images)
        card.delegate = self
        card.center = view.center
        card.layer.cornerRadius = 8.0
        card.clipsToBounds = true
        view.addSubview(card)
    }
}

extension ViewController: CardViewDelegate {

    func tapPosition(type: TapPosition, sender: TapCardView) {

        print(type)
        
        switch type {
        case .left:
            break
        case .right:
            break
        case .bottom:
            break
        }
    }
}

