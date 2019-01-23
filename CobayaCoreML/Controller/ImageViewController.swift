//
//  ImageViewController.swift
//  UIPageViewController2
//
//  Created by Ivan Riyanto on 24/08/18.
//  Copyright © 2018 Ivan Riyanto. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var gambarOnboardingImage: UIImageView!
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet{
            
            if let imageView = gambarOnboardingImage{
                
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gambarOnboardingImage.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
