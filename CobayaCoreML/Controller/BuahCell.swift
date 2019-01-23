//
//  BuahCell.swift
//  CobayaCoreML
//
//  Created by keenan warouw on 09/01/19.
//  Copyright © 2019 Sania Monica. All rights reserved.
//

import UIKit

class BuahCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBuah: UIImageView!
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.transform = CGAffineTransform(scaleX: 1.45, y: 1.45)
//                self.imageBuah.isHidden = false
            }
            else
            {
                self.transform = CGAffineTransform.identity
//                self.imageBuah.isHidden = true
            }
        }
    }
}
