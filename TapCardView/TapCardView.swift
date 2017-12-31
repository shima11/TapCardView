//
//  TapCardView.swift
//  TapCardView
//
//  Created by jinsei shima on 2017/12/31.
//  Copyright © 2017 jinsei shima. All rights reserved.
//

import Foundation
import UIKit

enum TapPosition {
    case left, right, bottom
}

protocol Tapable {
    var state: TapPosition { get }
    func getPosition() -> TapPosition

}

final class TapCardView: UIView {

    var images: [UIImage] = []
    var scrollView: UIScrollView = UIScrollView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture(sender:)))
        self.addGestureRecognizer(tapGesture)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapGesture(sender: UITapGestureRecognizer) {

        if sender.state == .ended {

            let tapPoint = sender.location(in: self)
            let tapPosition = getPosition(point: tapPoint, size: bounds.size)
            print(tapPosition)

            switch tapPosition {
            case .left, .right:
                flipCard(type: tapPosition)
            case .bottom:
                break
            }
        }
    }

    private func flipCard(type: TapPosition) {

        if type == .bottom { return }
        let radius: Float = (type == .left) ? 18 : -18
        let duration = 0.24

        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            let transform = CATransform3DIdentity
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: duration/2, animations: {
                self.layer.transform = CATransform3DRotate(transform, self.degree2radian(d: radius), 0, 1, 0)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: duration/2, animations: {
                self.layer.transform = CATransform3DRotate(transform, self.degree2radian(d: 0), 0, 1, 0)
            })
        }, completion: nil)
    }

    private func degree2radian(d: Float) -> CGFloat {

        let r = Float.pi * d/180
        return CGFloat(r)
    }

    private func getPosition(point: CGPoint, size: CGSize) -> TapPosition {

        if(point.y >= size.height*3/4) {
            return .bottom
        }
        else if(point.x >= size.width/2) {
            return .right
        }
        else {
            return .left
        }
    }

}
