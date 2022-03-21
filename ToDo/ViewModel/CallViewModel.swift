//
//  CallViewModel.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import Foundation


class CallViewModel {

    var delegate: ViewModelDelegate?
    var service: RequestProtocol?
    var callList: [CallModel] = []


    init (_ service: RequestProtocol) {
        self.service = service
    }

    func getCallList() {
        delegate?.didStartLoading()
        service?.getCallList(completion: { [weak self] data, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.errorDidOccur(error: error)
            } else {
                self.callList = data
                self.delegate?.itemsLoaded()
            }
        })
    }
}
