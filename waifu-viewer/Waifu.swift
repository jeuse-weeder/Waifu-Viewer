//
//  Waifu.swift
//  waifu-viewer
//
//  Created by shoshana on 24/11/2020.
//

import Foundation
struct Danbooru: Decodable {
    enum CodingKeys: String, CodingKey {
        case url = "file_url"
    }
    let url: String
    
}
