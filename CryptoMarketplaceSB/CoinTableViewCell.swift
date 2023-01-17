//
//  CoinTableViewCell.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/13/23.
//

import Foundation
import UIKit

class CoinTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let symbolLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        // Add nameLabel
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])


        // Add symbolLabel
        addSubview(symbolLabel)
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            symbolLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            symbolLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            symbolLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    func configure(with coin: CoinDataModel) {
        nameLabel.text = coin.name
        symbolLabel.text = coin.symbol
    }
}
