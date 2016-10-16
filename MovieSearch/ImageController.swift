//
//  ImageController.swift
//  MovieSearch
//
//  Created by Uldis Zingis on 14/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func image(forURL url: URL, completion: @escaping (UIImage?) -> Void) {
        NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            DispatchQueue.main.async { completion(image) }
        }
    }
}
