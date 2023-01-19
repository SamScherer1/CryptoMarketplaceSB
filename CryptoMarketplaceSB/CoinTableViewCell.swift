//
//  CoinTableViewCell.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/13/23.
//

import Foundation
import UIKit

func labelFor(text: String, font: UIFont) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = font
    label.text = text
    label.sizeToFit()
    return label
}

class CoinTableViewCell: UITableViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .darkGray
        label.sizeToFit()
        return label
    }()
    
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .right
        label.sizeToFit()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented (this is not a storyboard project)")
    }


    func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        
        let nameLabelConstraints = [
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let symbolLabelConstraints = [
            symbolLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 8),
            symbolLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let priceLabelConstraints = [
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(symbolLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
    }

    func configure(with coin: CoinModel) {
        nameLabel.text = coin.name
        symbolLabel.text = coin.symbol
    
        priceLabel.text = "coin.price"//TODO:
    }
}
