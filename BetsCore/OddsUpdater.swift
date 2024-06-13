//
//  OddsUpdater.swift
//  BetsCore
//
//  Created by David Alarcon on 13/6/24.
//

import Foundation

protocol Updater {
  associatedtype Updatable
  static func update(_ updatable: Updatable) -> Updatable
}

class OddsUpdater: Updater {
  static func update(_ updatable: Bet) -> Bet {
    .init(name: updatable.name,
          sellIn: updatable.sellIn + updatable.variation.sellIn,
          quality: updatable.quality + updatable.variation.quality,
          variation: updatable.variation)
  }
}
