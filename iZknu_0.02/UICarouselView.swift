//
//  UICarouselView.swift
//  CarouselViewTest
//
//  Created by Juno on 11/11/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class UICarouselView: UIView, UIScrollViewDelegate {
    var images: [UIImage]!
    var pages = 0 {
        willSet {
            pageControl.numberOfPages = newValue
        }
    }
    var currentPage = 0 {
        willSet {
            pageControl.currentPage = newValue
        }
    }
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var timer: NSTimer! 
    
    init(images: [UIImage], origin: CGPoint, height: CGFloat) {
        self.images = [images.last!] + images + [images.first!]
        super.init(frame: CGRect(origin: origin, size: CGSize(width: UIScreen.mainScreen().bounds.width, height: height)))
        pages = images.count
        setupPageControl()
        setupScrollView()
        setupImageViews()
        setupTimer()
        addViews()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * self.frame.width, height: self.frame.height)
        scrollView.contentOffset = CGPoint(x: self.frame.width, y: 0)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func setupImageViews() {
        let width = self.frame.width
        let height = self.frame.height
        for (index, image) in images.enumerate() {
            let x = CGFloat(index) * width
            let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: width, height: height))
            imageView.image = image
            /* 增加手势将影响scrollView的手势，可以用额外手势解决，不弄了
            imageView.userInteractionEnabled = true
            let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressGestureRecognizerAction:")
            longPressGestureRecognizer.minimumPressDuration = 0.01
            imageView.addGestureRecognizer(longPressGestureRecognizer)
            */
            scrollView.addSubview(imageView)
        }
    }
    
    func setupPageControl() {
        let width: CGFloat = 100
        let height: CGFloat = 10
        pageControl = UIPageControl(frame: CGRect(x: (self.frame.width - width) / 2, y: self.frame.height - height, width: width, height: height))
        pageControl.numberOfPages = pages
        pageControl.pageIndicatorTintColor = UIColor.grayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
    }
    
    func setupTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "autoScroll", userInfo: nil, repeats: true)
    }
    
    func addViews() {
        self.addSubview(scrollView)
        self.addSubview(pageControl)
    }
    
    //: MARK: ScrolViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let width = self.frame.width
        let index = Int(scrollView.contentOffset.x / width)
        switch index {
        case 1...images.count - 2:
            currentPage = index - 1
        case 0:
            currentPage = images.count - 2
            NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "backToEnd", userInfo: nil, repeats: false)
        case images.count - 1:
            scrollView.setContentOffset(CGPoint(x: width, y: 0), animated: false)
            currentPage = 0
        default:print("error in scrollViewDidScroll")
        }
    }
    
    // MARK: Actions
    func backToEnd() {
        let width = self.frame.width
        scrollView.contentOffset.x = width * CGFloat(images.count - 2)
    }

    func autoScroll() {
        let width = self.frame.width
        scrollView.setContentOffset(CGPoint(x: self.scrollView.contentOffset.x + width, y: 0), animated: true)
    }
    
    /*func longPressGestureRecognizerAction(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        switch longPressGestureRecognizer.state {
        case .Began, .Changed:
            self.timer.fireDate = NSDate.distantFuture()
            print("timer pause")
        case .Ended:
            self.timer.fireDate = NSDate.distantPast()
            print("timer resume")
        default: print("other state of \(longPressGestureRecognizer.state.rawValue)")
        }
    }*/
}
