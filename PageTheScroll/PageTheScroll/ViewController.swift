//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Noel Nolan Masters on 1/22/17.
//  Copyright © 2017 Noel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        view.addGestureRecognizer(scrollView.panGestureRecognizer)
        
        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            contentWidth += newX
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - (150/2), y: (scrollView.frame.size.height/2) - (150/2), width: 150, height: 150)
        }
        
//        scrollView.backgroundColor = UIColor.sddarkGray
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
    
}

