//
//  AppsRepository.swift
//  ToDo
//
//  Created by Dev on 3/21/22.
//

import Foundation


protocol AppsRepository {
    func loadSellList() -> [TradeModel]
}
