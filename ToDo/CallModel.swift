//
//  CallModel.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import Foundation
import ObjectMapper

struct CallModel: Mappable {

    var id: Int = 0
    var name: String = ""
    var number: String = ""

    init?(map: Map) {}
    init() {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        number <- map["number"]
    }
}
