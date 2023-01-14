//
//  CoinListTableView.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

import UIKit

class CoinListTableView: UITableView, UITableViewDataSource {
    var coinListViewModel = CoinListViewModel()
    
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
        coinListViewModel.fetchCoins()
        register(CoinTableViewCell.self, forCellReuseIdentifier: "CoinCell")
        dataSource = self
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
