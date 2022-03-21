//
//  TradeModel.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import Foundation
import ObjectMapper

struct TradeModel: Mappable {

    var name: String = ""
    var price: Double = 0
    var quantity: Int = 0
    var type: Int = 0

    init?(map: Map) {}
    init(name: String, price: Double, quantity: Int, type: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = type
    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        price <- map["price"]
        quantity <- map["quantity"]
        type <- map["type"]
    }
}

