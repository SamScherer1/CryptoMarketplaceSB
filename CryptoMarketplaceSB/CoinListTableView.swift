//
//  CoinListTableView.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

import UIKit
import SDWebImage

class CoinDetailViewController: UIViewController {
    var coin: CoinDataModel!

    var coinNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var coinSymbolLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var coinImageView = UIImageView(image: UIImage(named: "circle"))

    override func viewDidLoad() {
        super.viewDidLoad()
        coinNameLabel.text = coin.name
        coinSymbolLabel.text = coin.symbol
        // You can load image from url by using a library like SDWebImage
        coinImageView.sd_setImage(with: URL(string: "https://coincheckup.com/images/coins/\(coin.id).png"))
    }
}

class CoinListTableView: UITableView, UITableViewDataSource {
    var coinListViewModel = CoinListViewModel()
    var navigationController: UINavigationController
    
    init(coinListViewModel: CoinListViewModel = CoinListViewModel(), navigationController: UINavigationController) {
        self.coinListViewModel = coinListViewModel
        self.navigationController = navigationController
        super.init(frame: CGRect(), style: .plain)
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
        allowsSelection = false
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
