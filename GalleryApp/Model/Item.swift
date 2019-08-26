//
//  Item.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Item {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

extension Item {
    init(jsonData: JSON) {
        albumId = jsonData["albumId"].intValue
        id = jsonData["id"].intValue
        title = jsonData["title"].stringValue
        url = jsonData["url"].stringValue
        thumbnailUrl = jsonData["thumbnailUrl"].stringValue
    }
}
