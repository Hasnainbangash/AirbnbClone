//
//  AddSomePhoto.swift
//  AirbnbClone
//
//  Created by Elexoft on 30/01/2025.
//

import UIKit

struct AddSomePhoto {
    
   let image: Any // Can be String or UIImage
   let isAsset: Bool // To distinguish between asset names and UIImages
   
   init(image: String) {
       self.image = image
       self.isAsset = true
   }
   
   init(uiImage: UIImage) {
       self.image = uiImage
       self.isAsset = false
   }
    
}
