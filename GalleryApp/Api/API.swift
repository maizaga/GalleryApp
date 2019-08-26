//
//  API.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import Foundation
import Siesta

class API: Service {
    static let sharedInstance = API()
    
    init() {
        super.init(baseURL: Constants.baseUrl)
        
        configure {
            $0.pipeline[.parsing].add(SwiftyJSONTransformer, contentTypes: ["*/json"])
        }
    }
    
    var photos: Resource { return resource(Constants.photos) }
}
