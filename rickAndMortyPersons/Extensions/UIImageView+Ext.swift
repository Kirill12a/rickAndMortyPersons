//
//  UIImageView+Ext.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import Foundation
import UIKit

public var cache = NSCache<AnyObject, AnyObject>()
extension UIImageView{
    func loadInCacheImage(from urlString: String, key: String){
        backgroundColor = .lightGray
        image = nil
        
        if let cachedImage = cache.object(forKey: key as AnyObject) as? UIImage{
            image = cachedImage
            return
        }
        
        Services().fetch(url: urlString) { (result) in
            switch result {
            case .success(let image):
                cache.setObject(image, forKey: key as AnyObject)
                DispatchQueue.main.async {
                    self.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
