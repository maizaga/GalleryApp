//
//  RemoteImageView.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import UIKit
import Siesta

class RemoteImageView: UIImageView {
    static var imageCache: Service = Service()
    
    var placeholderImage: UIImage?
    
    var imageURL: URL? {
        get { return imageResource?.url }
        set { imageResource = RemoteImageView.imageCache.resource(absoluteURL: newValue) }
    }
    
    var imageResource: Resource? {
        willSet {
            imageResource?.removeObservers(ownedBy: self)
            imageResource?.cancelLoadIfUnobserved(afterDelay: 0.05)
        }
        
        didSet {
            imageResource?.loadIfNeeded()
            imageResource?.addObserver(owner: self) { [weak self] _,_ in
                self?.image = self?.imageResource?.typedContent(
                    ifNone: self?.placeholderImage)
            }
        }
    }
}
