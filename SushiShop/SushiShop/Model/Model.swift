//
//  Model.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import Foundation

struct Sushi: Codable {
    let status: Bool
    let menuList: [MenuList]
}

struct MenuList: Codable {
    let menuID, image, name: String?
    let id, content, price: String?
    let weight, spicy: String?
    let subMenuCount: Int?
}
