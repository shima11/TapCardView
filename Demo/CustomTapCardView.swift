//
//  CustomTapCardView.swift
//  Demo
//
//  Created by jinsei shima on 2018/01/01.
//  Copyright © 2018 jinsei shima. All rights reserved.
//

import UIKit

final class CustomTapCardView: TapCardView {

    var currentPage: Int = 0

    init(frame: CGRect, datas: [UIImage]) {

        super.init(frame: frame)

        numberOfPage = datas.count

        scrollView = getScrollView()
        addSubview(scrollView)

        gradientLayer = getGradientLayer()
        layer.addSublayer(gradientLayer)

        pageControl = getPageControl()
        addSubview(pageControl)

        for index in  0..<numberOfPage {

            let view = UIImageView(frame: CGRect(x: CGFloat(index) * bounds.width, y: 0, width: bounds.width, height: bounds.height))
            view.image = datas[index]
            view.contentMode = .center
            view.clipsToBounds = true
            view.backgroundColor = UIColor.lightGray
            scrollView.addSubview(view)
        }
        
        let userDefault = UserDefaults.standard
        if userDefault.bool(forKey: "isFirstLaunch") {
            userDefault.set(false, forKey: "isFirstLaunch")
            showTutorialView()
        }

    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    override func tapGesture(sender: UITapGestureRecognizer) {

        super.tapGesture(sender: sender)

        if sender.state == .ended {

            let tapPoint = sender.location(in: self)
            let tapPosition = getTapPosition(point: tapPoint, size: bounds.size)

            switch tapPosition {
            case .left:
                if currentPage - 1 >= 0 { // slide card view images
                    currentPage -= 1
                    pageControl.currentPage = currentPage
                    slideCardView(index: currentPage, animated: false)
                }
                else { // when left end, flip card view
                    flipCard(type: tapPosition)
                }

            case .right:
                if currentPage + 1 < numberOfPage { // slide card view images
                    currentPage += 1
                    pageControl.currentPage = currentPage
                    slideCardView(index: currentPage, animated: false)
                }
                else { // when right end, flip card view
                    flipCard(type: tapPosition)
                }

            case .bottom:
                break
            }
        }
    }

    private var scrollView = UIScrollView()
    private var gradientLayer = CAGradientLayer()
    private var pageControl = UIPageControl()
    private var numberOfPage = 0

    private func slideCardView(index: Int, animated: Bool) {

        let _x = scrollView.bounds.width*CGFloat(currentPage)
        let _y = 0
        var frame: CGRect = scrollView.bounds
        frame.origin.x = _x
        frame.origin.y = CGFloat(_y)
        scrollView.scrollRectToVisible(frame, animated: animated)
    }

    private func getScrollView() -> UIScrollView {

        let scrollView = UIScrollView(frame: CGRect(origin: .zero, size: bounds.size))
        scrollView.center = center
        scrollView.contentSize = CGSize(width: bounds.width * CGFloat(numberOfPage), height: bounds.height)
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }

    private func getGradientLayer() -> CAGradientLayer {

        let gradientLayer = CAGradientLayer()
        let height: CGFloat = 80
        gradientLayer.frame = CGRect(x: 0, y: bounds.height - height, width: bounds.width, height: height)
        let firstColor: UIColor = UIColor.white.withAlphaComponent(0.8)
        let endColor: UIColor = UIColor.white.withAlphaComponent(0.0)
        let gradientColors: [CGColor] = [firstColor.cgColor, endColor.cgColor]
        gradientLayer.colors = gradientColors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x:0, y:1)
        gradientLayer.endPoint = CGPoint(x:0, y:0)
        return gradientLayer
    }

    private func getPageControl() -> UIPageControl {

        let pageControl = UIPageControl(frame: CGRect(origin: .zero, size: CGSize(width: bounds.width*0.8, height: 40)))
        pageControl.pageIndicatorTintColor = UIColor.darkGray.withAlphaComponent(0.6)
        pageControl.center = CGPoint(x: bounds.width/2, y: bounds.height-20)
        pageControl.numberOfPages = numberOfPage
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }

    private func showTutorialView() {

        let view = TutorialView(frame: bounds)
        addSubview(view)
    }
}

class TutorialView: UIView {

    override init(frame: CGRect) {

        super.init(frame: frame)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(sender:)))
        addGestureRecognizer(tapGesture)

        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named:"tutorial")
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapGesture(sender: UITapGestureRecognizer) {

        // fade out
        UIView.animate(
            withDuration: 0.28,
            animations: {
                self.alpha = 0.0
        },
            completion: { _ in
                self.removeFromSuperview()
        })
    }
}
