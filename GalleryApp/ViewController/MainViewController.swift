//
//  ViewController.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {

    private let itemsPerRow = CGFloat(2)
    private let reuseIdentifier = "galleryCell"
    private var items = [Item]()
    private var totalHits = 0
    private var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getItems()
    }

    func getItems() {
        showNetworkIndicator()
        API.sharedInstance.getPhotos()
            .onCompletion { _ in
                hideNetworkIndicator()
            }
            .onSuccess { data in
                self.items = data.json.arrayValue.map { value in
                    Item(jsonData: value)
                }
                self.collectionView.reloadData()
            }
            .onFailure { error in
                print(error)
        }
    }
    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let cell = sender as? UICollectionViewCell,
//            let indexPath = self.collectionView.indexPath(for: cell) {
//
//            let vc = segue.destination as! DetailViewController
//            vc.item = items[indexPath.row]
//        }
//    }
}

extension MainViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainCollectionViewCell
        cell.loadFromUrl(urlStr: items[indexPath.row].thumbnailUrl)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 && items.count < totalHits {
            page += 1
            getItems()
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = CGFloat(16 + 8 + 8)
        let size = collectionView.frame.size.width - padding
        let itemSize = size / itemsPerRow
        
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    }
}
