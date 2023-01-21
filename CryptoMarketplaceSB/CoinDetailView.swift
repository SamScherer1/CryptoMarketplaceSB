//
//  CoinDetailView.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/15/23.
//

import UIKit
import Highcharts

let kMarginWidth = 10.0

class CoinDetailViewController: UIViewController {
    var viewModel: CoinDetailViewModel
    
    var coinNameLabel = labelWith(fontSize: 24, textColor: .darkGray)
    var coinSymbolLabel = labelWith(fontSize: 16, textColor: .lightGray)
    var chartView = {
        let chart = HIChartView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    var coinImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(viewModel: CoinDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        coinNameLabel.text = viewModel.coin.name
        coinSymbolLabel.text = viewModel.coin.formattedSymbol
        coinImageView.image = viewModel.coin.image
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(goBack))
        navigationItem.leftBarButtonItem?.tintColor = .titleHighlight
        setupConstrints()
        self.navigationItem.title = "\(viewModel.coin.name) Details"
    }
    
    func setupConstrints() {
        
        view.addSubview(coinImageView)
        
        NSLayoutConstraint.activate([
            coinImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: kMarginWidth),
            coinImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: kMarginWidth),
            coinImageView.widthAnchor.constraint(equalTo: coinImageView.heightAnchor),
            coinImageView.heightAnchor.constraint(equalToConstant: 100.0)
        ])
        
        view.addSubview(coinNameLabel)
        
        NSLayoutConstraint.activate([
            coinNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: kMarginWidth),
            coinNameLabel.leftAnchor.constraint(equalTo: coinImageView.rightAnchor, constant: kMarginWidth)
        ])
        
        view.addSubview(coinSymbolLabel)
        
        NSLayoutConstraint.activate([
            coinSymbolLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: kMarginWidth),
            coinSymbolLabel.leftAnchor.constraint(equalTo: coinImageView.rightAnchor, constant: kMarginWidth)
        ])
    }
    
    static func labelWith(fontSize: Double, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.tintColor = textColor
        return label
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
