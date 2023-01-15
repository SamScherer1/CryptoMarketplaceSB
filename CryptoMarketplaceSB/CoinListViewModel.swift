//
//  CoinListViewModel.swift
//  CryptoMarketplaceSB
//
//  Created by Samuel Scherer on 1/14/23.
//

import UIKit


struct CoinDataModel: Decodable {
    let id: String
    let name: String
    let symbol: String
}

class CoinListViewModel {
    var coinList = [CoinDataModel]()
    var coinNameList = [String]()
    var dataChanged: (() -> ())?
    
    func getCoinList(completion: @escaping ([CoinDataModel]?) -> Void) {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/list")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let coinList = try JSONDecoder().decode([CoinDataModel].self, from: data)
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

    func fetchSupportedCoinSymbols() {
        let url = URL(string: "https://api.coingecko.com/api/v3/simple/supported_vs_currencies")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            print("entered task....")
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            do {
                if let decodedJSON = try? JSONDecoder().decode([String].self, from: data) {
                    print("decodedJSONDictionary: \(decodedJSON)")
                    self?.coinNameList = decodedJSON
                    self?.coinList = self!.coinNameList.map({ symbolString in
                        return CoinDataModel(id: symbolString, name: symbolString, symbol: symbolString)//TODO: get actual data (need additional call? or is there a call (list()?) that returns all info...
                    })
                }
                self?.dataChanged?()
            }
        }
        task.resume()
    }
}

