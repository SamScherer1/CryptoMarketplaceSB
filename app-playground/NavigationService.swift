//
//  NavigationService.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/19/23.
//

import UIKit

class MyNavigationService {
    static let shared = MyNavigationService(navigationController: nil)

    private var navigationController: UINavigationController
    
    private init(navigationController: UINavigationController?) {
        if let navigationController {
            self.navigationController = navigationController
        } else {
            self.navigationController = UINavigationController()
        }
    }

    func initialize(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

//    func goToMainTableView() {
//        let coinListViewController = CoinListViewController()
//        navigationController.pushViewController(coinListViewController, animated: true)
//    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }

    func goToDetailView(coin: Coin) {
        let detailViewController = CoinDetailViewController(viewModel: CoinDetailViewModel(coin: coin))
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
