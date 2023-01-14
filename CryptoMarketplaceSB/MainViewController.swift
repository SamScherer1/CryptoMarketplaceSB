//
//  MainViewController.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

/// A wrapping, top level ViewController

import UIKit

class CoinListViewController: UIViewController {
    let coinListTableView = CoinListTableView()
    override func loadView() {
        view = coinListTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coinListTableView.setup()
    }

}
