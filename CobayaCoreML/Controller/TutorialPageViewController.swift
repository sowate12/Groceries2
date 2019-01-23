//
//  TutorialPageViewController.swift
//  UIPageViewController2
//
//  Created by Ivan Riyanto on 23/08/18.
//  Copyright © 2018 Ivan Riyanto. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {

    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    let images = ["1","2","3","4"]
    lazy var vc : [ImageViewController] = {
        return [getItemController(0),getItemController(1),getItemController(2),getItemController(3)]
        }() as! [ImageViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        // Do any additional setup after loading the view.
        if images.count > 0 {
            let firstController = getItemController(0)!
            let startingViewController = [firstController]
            setViewControllers(startingViewController, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
            
        }
         tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageCount: images.count)
        //buat page di pageview sesuai dengan jumlah image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getItemController (_ itemIndex: Int) -> ImageViewController? {
        if itemIndex < images.count{
            //panggil storyboard identifier itemcontroller
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "ItemController") as! ImageViewController
            
            //assign sesuai dengan variable yang ada di imagecontroller
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = images[itemIndex]
            return pageItemController
        }
        return nil
    }
}

extension TutorialPageViewController: UIPageViewControllerDataSource,UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! ImageViewController
        if itemController.itemIndex > 0 {
            return vc[itemController.itemIndex-1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! ImageViewController
        if itemController.itemIndex+1 < images.count {
            return vc[itemController.itemIndex+1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,didFinishAnimating finished: Bool,previousViewControllers: [UIViewController],transitionCompleted completed: Bool){
        if let firstViewController = viewControllers?.first as? ImageViewController,
        let index = vc.index(of: firstViewController)
        {
            tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
}

protocol TutorialPageViewControllerDelegate: class {
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,didUpdatePageCount count: Int)
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,didUpdatePageIndex index: Int)
}
