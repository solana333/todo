//
//  CoreDataAppsRepository.swift
//  ToDo
//
//  Created by Dev on 3/21/22.
//

import Foundation
import CoreData
import UIKit

final class CoreDataAppsRepository: AppsRepository {

    static let shared = CoreDataAppsRepository()
    var data: [NSManagedObject] = []

    var isEmpty: Bool {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemToSell")
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return true
            }

            let managedContext = appDelegate.persistentContainer.viewContext
            let count  = try managedContext.count(for: request)
            return count == 0
        } catch {
            return true
        }
    }

    init() {
        // Just init once
        if isEmpty {
            initializeFirstData()
        }
    }

    func initializeFirstData() {
        let tableModel = TradeModel(name: "Table", price: 12000, quantity: 1, type: 2)
        let tvModel = TradeModel(name: "TV", price: 3800, quantity: 2, type: 2)
        let phoneModel = TradeModel(name: "IPhoneX", price: 150000, quantity: 1, type: 2)
        save(data: tableModel)
        save(data: tvModel)
        save(data: phoneModel)
    }

    func save(data: TradeModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ItemToSell", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(data.name, forKeyPath: "name")
        person.setValue(data.price, forKeyPath: "price")
        person.setValue(data.quantity, forKeyPath: "quantity")

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func loadSellList() ->[TradeModel] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ItemToSell")

        do {
            data = try managedContext.fetch(fetchRequest)
            return convertToSellList()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }

    func convertToSellList() -> [TradeModel] {
        var sellList: [TradeModel] = []
        for element in data {
            let name = element.value(forKeyPath: "name") as? String
            let price = element.value(forKeyPath: "price") as? Double
            let quantity = element.value(forKeyPath: "quantity") as? Int
            let type = element.value(forKeyPath: "type") as? Int
            let data = TradeModel(name: name ?? "", price: price ?? 0, quantity: quantity ?? 0, type: type ?? 0)
            sellList.append(data)
        }
        return sellList
    }
}
