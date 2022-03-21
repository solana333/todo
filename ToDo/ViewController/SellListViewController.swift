//
//  SellListViewController.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import UIKit
import CoreData

class SellListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    let appsRepository: AppsRepository = CoreDataAppsRepository.shared
    var sellList: [TradeModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadData()
    }

    private func setupView() {
        title = "Sell List"
        self.tableView.register(UINib(nibName: "TradeListTableViewCell", bundle: nil), forCellReuseIdentifier: "TradeListTableViewCell")
    }

    private func loadData() {
        sellList = appsRepository.loadSellList()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SellListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TradeListTableViewCell", for: indexPath) as! TradeListTableViewCell
        cell.bindData(data: sellList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 183
    }
}

