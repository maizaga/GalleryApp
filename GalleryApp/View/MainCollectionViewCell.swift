//
//  MainCollectionViewCell.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: RemoteImageView?
    
    func loadFromUrl(urlStr: String) {
        let url = URL(string: urlStr)
        imageView?.imageURL = url
    }
}
