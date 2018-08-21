//
//  FullImageViewController.swift
//  TravelPics
//
//  Created by Juan Meza on 12/30/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var fullImgView: UIImageView!
    @IBOutlet weak var scrollerView: UIScrollView!
    
    var fullImage = UIImage(named:"1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollerView.delegate = self
        
        fullImgView.image = fullImage
        
        scrollerView.minimumZoomScale = 1
        scrollerView.maximumZoomScale = 4
        scrollerView.contentSize = fullImgView.frame.size
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return fullImgView
    }
}
