//
//  News.swift
//  internettenVeriCekme
//
//  Created by doğan güneş on 20.02.2023.
//

import Foundation
  
// Decodable protokolü ile internetten aldığımız veriyi kullanılabilir hale getiriyoruz

struct News : Decodable {
    // aldğımız veride title ve story stringleri json formatında mevcut 
    let title : String
    let story : String
    
}
