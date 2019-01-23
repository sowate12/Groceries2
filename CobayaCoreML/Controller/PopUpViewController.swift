//
//  PopUpViewController.swift
//  UIPageViewController2
//
//  Created by Ivan Riyanto on 10/01/19.
//  Copyright © 2019 Ivan Riyanto. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backViewAtas.isHidden = true
        backView.layer.cornerRadius = 50
        imageBackground.layer.cornerRadius = 50
        imageBackground.layer.masksToBounds = true
        
        backViewAtas.layer.cornerRadius = 50
        backViewAtas.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        ijoIjoAtas.layer.cornerRadius = 50
        ijoIjoAtas.layer.masksToBounds = true
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showLessButton(_ sender: Any) {
        backViewAtas.isHidden = true
        backView.isHidden = false
    }
    @IBOutlet weak var ijoIjoAtas: UIImageView!
    @IBOutlet weak var backViewAtas: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBAction func showMoreDetailButton(_ sender: Any) {
        //ketika pencet showmore, tunjukin view controller satu lagi
        backViewAtas.isHidden = false
        backView.isHidden = true
        
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0;
            self.view.transform = CGAffineTransform(translationX: 1.0, y: 1.0)
        }
    }

    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(translationX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }) { (finished : Bool) in
            if (finished){
                self.view.removeFromSuperview()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeAnimate()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
