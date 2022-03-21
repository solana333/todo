//
//  TradeViewModel.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import Foundation

protocol ViewModelDelegate {
    func errorDidOccur (error: Error)
    func didStartLoading()
    func itemsLoaded()
}

class TradeViewModel {

    var delegate: ViewModelDelegate?
    var service: RequestProtocol?
    var buyList: [TradeModel] = []


    init (_ service: RequestProtocol) {
        self.service = service
    }

    func getBuyList() {
        delegate?.didStartLoading()
        service?.getBuyList(completion: { [weak self] data, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.errorDidOccur(error: error)
            } else {
                self.buyList = data
                self.delegate?.itemsLoaded()
            }
        })
    }
}
