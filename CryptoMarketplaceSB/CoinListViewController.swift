//
//  MainViewController.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

/// A wrapping, top level ViewController

import UIKit

class CoinListViewController: UIViewController {
    var coinListTableView: CoinListTableView!
    
    override func loadView() {
        coinListTableView = CoinListTableView()
        view = coinListTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.edgesForExtendedLayout = UIRectEdge.all
        self.navigationItem.title = "Supported Coins"
        coinListTableView.setup()
    }

}
