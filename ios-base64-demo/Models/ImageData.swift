//
//  ImageData.swift
//  ios-base64-demo
//
//  Created by Eiji Kushida on 2017/07/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import RealmSwift

enum ImageDataType: String {
    case png = "png"
    case jpeg = "jpeg"
}

class ImageData: Object {
    dynamic var imageId = 0
    dynamic var imageData = ""
    dynamic var imageDataType = ""
    
    override static func primaryKey() -> String? {
        return "imageId"
    }
}
