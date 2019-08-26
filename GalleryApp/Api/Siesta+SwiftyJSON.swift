//
//  Siesta+SwiftyJSON.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import Foundation
import Siesta
import SwiftyJSON

let SwiftyJSONTransformer =
    ResponseContentTransformer(transformErrors: true)
    { JSON($0.content as AnyObject) }

extension TypedContentAccessors {
    var json: JSON
    { return typedContent(ifNone: JSON.null) }
}
