//
//  PhotoCollectionViewCell.swift
//  PhotoApplicationMVVM
//
//  Created by Rufan Abdurahmanov on 31.10.21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "toPhotoCollectionViewCell"
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        
    }
    
    
    
}
