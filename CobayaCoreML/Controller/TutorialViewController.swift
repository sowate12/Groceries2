//
//  TutorialViewController.swift
//  UIPageViewController2
//
//  Created by Ivan Riyanto on 24/08/18.
//  Copyright © 2018 Ivan Riyanto. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            tutorialPageViewController.tutorialDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func skipButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        //change the status in userdefault into OnBoardingComplete
        userDefaults.set(true, forKey: "OnBoardingComplete")        
        userDefaults.synchronize()
        
        performSegue(withIdentifier: "OnboardingToMain", sender: self)
    }
}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageCount count: Int) { pageControll.numberOfPages = count
    }
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
