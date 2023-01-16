//
//  CoinListTableView.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

import UIKit
import SDWebImage

class CoinListTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var coinListViewModel = CoinListViewModel()
    var navigationController: UINavigationController
    
    init(coinListViewModel: CoinListViewModel = CoinListViewModel(), navigationController: UINavigationController) {
        self.coinListViewModel = coinListViewModel
        self.navigationController = navigationController
        super.init(frame: CGRect(), style: .plain)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        DispatchQueue.main.async { [weak self] in
            self?.setup()
        }
    }

    func setup() {
        coinListViewModel.dataChanged = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.reloadData()
            }
        }
        coinListViewModel.getCoinList(completion: { [weak self] coinList in
            if let coinList {
                self?.coinListViewModel.coinList = coinList
            }
        })
        register(CoinTableViewCell.self, forCellReuseIdentifier: "CoinCell")
        dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCoin = coinListViewModel.coinList[indexPath.row]
        let detailVC = CoinDetailViewController()
        detailVC.coin = selectedCoin
        navigationController.pushViewController(detailVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinListViewModel.coinList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath)
        let coin = coinListViewModel.coinList[indexPath.row]
        cell.textLabel?.text = coin.name
        cell.detailTextLabel?.text = coin.symbol
        return cell
    }
}
