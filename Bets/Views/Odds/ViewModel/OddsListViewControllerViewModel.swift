//
//  OddsListViewControllerViewModel.swift
//  Bets
//
//  Created by David Alarcon on 11/6/24.
//

import Foundation
import BetsCore

class OddsListViewControllerViewModel {
  private let repository: BetRepository
  var items: [Bet] = []
  
  init(repository: BetRepository) {
    self.repository = repository
  }
}
