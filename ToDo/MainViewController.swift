//
//  ViewController.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func callListAction(_ sender: Any) {
        let vc = CallListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func buyListAction(_ sender: Any) {
        let vc = BuyListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func sellListAction(_ sender: Any) {
        let vc = SellListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

