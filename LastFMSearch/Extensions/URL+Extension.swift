//
//  URL+Extension.swift
//  LastFMSearch
//
//  Created by Consultant on 1/9/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

extension URL {
    
    // Allows convering an image URL to a UIImage
    func getImage(completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: self) { (dat, _, _) in
            if let data = dat {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    completion(image)
                }
            }
        }.resume()
    }
}
