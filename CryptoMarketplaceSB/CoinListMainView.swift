//
//  CoinListMainView.swift
//  CryptoMarketplace
//
//  Created by Samuel Scherer on 1/13/23.
//

import Foundation
import UIKit


struct CoinDataModel: Decodable {
    let id: String
    let name: String
    let symbol: String
}

class CoinListViewModel {
    var coinList = [CoinDataModel]()
    var dataChanged: (() -> ())?

    func fetchCoins() {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/list")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            do {
                if let decodedJSONDictionary = try? JSONDecoder().decode([String: [CoinDataModel]].self, from: data) {
                    self?.coinList = decodedJSONDictionary["description"]!//TODO: think about unwrap
                    print("self.coinList: \(self?.coinList[0...5])")
                }
                self?.dataChanged?()
            }
//            catch let jsonError {
//                print("Error decoding JSON: \(jsonError)")
//            }
        }
        task.resume()
    }
}

class CoinListViewController: UIViewController, UITableViewDelegate {
    let coinListTableView = CoinListTableView()
    override func loadView() {
        view = coinListTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        coinListTableView.setup()
    }

}

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
