//
//  CoinListTableView.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

import UIKit
//import SDWebImage

class CoinListTableViewController: UITableViewController {
    var coinListViewModel = CoinListViewModel()
    
    init(coinListViewModel: CoinListViewModel = CoinListViewModel()) {
        self.coinListViewModel = coinListViewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.navigationItem.title = "Supported Coins"
        coinListViewModel.setupWith { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: "CoinCell")
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCoin = coinListViewModel.coinList[indexPath.row]
        coinListViewModel.pushDetailFor(coin: selectedCoin)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinListViewModel.coinList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as! CoinTableViewCell
        let coin = coinListViewModel.coinList[indexPath.row]
        cell.configure(with:coin)
        return cell
    }
}
