//
//  ImageDataDao.swift
//  ios-base64-demo
//
//  Created by Eiji Kushida on 2017/07/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

final class ImageDataDao {
    
    static let dao = RealmDaoHelper<ImageData>()
    
    static func add(model: ImageData) {
        
        let object = ImageData()
        object.imageId = ImageDataDao.dao.newId()!
        object.imageData = model.imageData
        object.imageDataType = model.imageDataType
        ImageDataDao.dao.add(d: object)
    }
}


