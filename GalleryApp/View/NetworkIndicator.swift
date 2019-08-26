//
//  NetworkIndicator.swift
//  GalleryApp
//
//  Created by Martiniano Aizaga on 26/08/2019.
//  Copyright © 2019 Martiniano Aizaga. All rights reserved.
//

import Foundation
import PKHUD

func showNetworkIndicator() {
    showSmallNetworkIndicator()
    HUD.show(.progress)
}

func hideNetworkIndicator() {
    hideSmallNetworkIndicator()
    HUD.hide(animated: true)
}

func showSmallNetworkIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
}

func hideSmallNetworkIndicator() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
}
