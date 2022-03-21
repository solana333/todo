//
//  CallListViewController.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import UIKit

class CallListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = CallViewModel(RequestManager.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupView()
        loadData()
    }
    
    private func setupView() {
        title = "Call List"
        self.tableView.register(UINib(nibName: "CallListTableViewCell", bundle: nil), forCellReuseIdentifier: "CallListTableViewCell")
    }

    private func loadData() {
        self.viewModel.getCallList()
    }
}

extension CallListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.callList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CallListTableViewCell", for: indexPath) as! CallListTableViewCell
        cell.bindData(data: viewModel.callList[indexPath.row])
        return cell
    }
}

extension CallListViewController: ViewModelDelegate {

    func errorDidOccur(error: Error) {
        print(error.localizedDescription)
    }

    func didStartLoading() {
        self.showLoading()
    }

    func itemsLoaded() {
        hideLoading()
        self.tableView.reloadData()
    }
}

