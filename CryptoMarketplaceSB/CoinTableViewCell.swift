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
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true

        // Add symbolLabel
        addSubview(symbolLabel)
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        symbolLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        symbolLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        symbolLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }

    func configure(with coin: CoinDataModel) {
        nameLabel.text = coin.name
        symbolLabel.text = coin.symbol
    }
}
