//
//  CoinListViewModel.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

import UIKit

struct CoinListItem: Decodable {//TODO: rename to CoinListItem
    let id: String
    let name: String
    let symbol: String
    //let creationDate = Date()
}

struct Coin {
    init(coinListItem: CoinListItem) {
        self.id = coinListItem.id
        self.name = coinListItem.name
        self.symbol = coinListItem.symbol
    }
    
    
    let id: String
    let name: String
    let symbol: String
    var image = UIImage.init(systemName: "circle.slash")
    var formattedSymbol: String {
        get {
             return "(\(symbol))"
         }
    }
}

class CoinListViewModel {
    var coinList = [Coin]()
    var coinNameList = [String]()
    var dataChanged: (() -> ())?
    
    func getCoinListItems(completion: @escaping ([CoinListItem]?) -> Void) {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/list")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let coinList = try JSONDecoder().decode([CoinListItem].self, from: data)
                    completion(coinList)
                    self.dataChanged?()
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            } else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func setup() {
        getCoinListItems(completion: { [weak self] coinListItems in
            guard let self else { return }
            guard let coinListItems = coinListItems else { return }
            self.coinList = coinListItems.map{ item -> Coin in
                return Coin(coinListItem: item)
            }
        })
    }

    
    func pushDetailFor(coin: Coin) {
        MyNavigationService.shared.goToDetailView(coin: coin)
    }

//    func fetchSupportedCoinSymbols() {
//        let url = URL(string: "https://api.coingecko.com/api/v3/simple/supported_vs_currencies")!
//        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
//            print("entered task....")
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            guard let data = data else {
//                print("No data returned")
//                return
//            }
//
//            do {
//                if let decodedJSON = try? JSONDecoder().decode([String].self, from: data) {
//                    print("decodedJSONDictionary: \(decodedJSON)")
//                    self?.coinNameList = decodedJSON
//                    self?.coinList = self!.coinNameList.map({ symbolString in
//                        let coinListItem = CoinListItem(id: symbolString, name: symbolString, symbol: symbolString)
//                        return
//                    })
//                }
//                self?.dataChanged?()
//            }
//        }
//        task.resume()
//    }
}

