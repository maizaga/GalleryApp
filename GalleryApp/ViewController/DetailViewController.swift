//
//  DetailViewController.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 28/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: Item? = nil
    
    @IBOutlet weak var imageView: RemoteImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = self.item {
            imageLabel?.text = item.title
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let item = self.item {
            let url = URL(string: item.url)
            UIView.transition(with: imageView, duration: 0.3, options: [.transitionFlipFromLeft], animations: { [weak self] in
                self?.imageView?.imageURL = url
            })
        }
    }
}
