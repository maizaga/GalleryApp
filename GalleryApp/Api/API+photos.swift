//
//  API+photos.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import Foundation
import Siesta

extension API {
    
    func getPhotos() -> Request {
        return photos
            .request(.get)
    }
}
