//
//  BaseViewController.swift
//  ToDo
//
//  Created by Dev on 3/21/22.
//

import UIKit

let tagLoading: Int = 999999

class BaseViewController: UIViewController {

    lazy var loadingView: LoadingView = LoadingView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func showLoading() {
        self.loadingView.tag = tagLoading
        self.view.addSubview(self.loadingView)
    }

    func hideLoading() {
        if let viewWithTag = self.view.viewWithTag(tagLoading) {
            viewWithTag.removeFromSuperview()
        }
    }
}
