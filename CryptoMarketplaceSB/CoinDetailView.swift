//
//  CoinDetailView.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/15/23.
//

import UIKit

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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(goBack))
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
