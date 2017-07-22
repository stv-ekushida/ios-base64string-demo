//
//  ViewController.swift
//  ios-base64-demo
//
//  Created by Eiji Kushida on 2017/07/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = strToUIImage(base64String: Image.jpeg())
    }
    
    /// Base64文字列をUIImageに変換
    func strToUIImage(base64String: String) -> UIImage?{
        
        guard let decodedData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: decodedData)
    }
    
    /// 画像をBase64文字列に変換
    func saveBase64Jpeg() {
    
        let image = #imageLiteral(resourceName: "cat1")
        
        let jpegCompressionQuality: CGFloat = 1
        if let base64String = UIImageJPEGRepresentation(image, jpegCompressionQuality)?.base64EncodedString() {
            save(base64String: base64String, type: ImageDataType.jpeg)
        }
    }
    
    func saveBase64Png() {
        
        let image = #imageLiteral(resourceName: "draemon")
        
        if let base64String = UIImagePNGRepresentation(image)?.base64EncodedString() {
            save(base64String: base64String, type: ImageDataType.png)
        }
    }
    
    func save(base64String: String, type: ImageDataType) {
        let imageData = ImageData()
        imageData.imageData = base64String
        imageData.imageDataType = type.rawValue
        ImageDataDao.add(model: imageData)
    }
}

