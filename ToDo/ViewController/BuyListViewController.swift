//
//  BuyListViewController.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import UIKit

class BuyListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = TradeViewModel(RequestManager.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupView()
        loadData()
    }

    private func setupView() {
        title = "Buy List"
        self.tableView.register(UINib(nibName: "TradeListTableViewCell", bundle: nil), forCellReuseIdentifier: "TradeListTableViewCell")
    }

    private func loadData() {
        self.viewModel.getBuyList()
    }
}

extension BuyListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.buyList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TradeListTableViewCell", for: indexPath) as! TradeListTableViewCell
        cell.bindData(data: viewModel.buyList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 183
    }
}

extension BuyListViewController: ViewModelDelegate {

    func didStartLoading() {
        self.showLoading()
    }

    func errorDidOccur(error: Error) {
        print(error.localizedDescription)
        self.hideLoading()
    }

    func itemsLoaded() {
        self.tableView.reloadData()
        self.hideLoading()
    }
}
